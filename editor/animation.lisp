(in-package #:org.shirakumo.fraf.kandria)

(define-shader-entity hurtbox (vertex-entity colored-entity sized-entity standalone-shader-entity alloy:layout-element)
  ((vertex-array :initform (// 'kandria '1x))
   (color :initform (vec 1 0 0 0.5))))

(defmethod apply-transforms progn ((hurtbox hurtbox))
  (let ((size (bsize hurtbox)))
    (translate-by (- (vx size)) (- (vy size)) 100)
    (scale-by (* 2 (vx size)) (* 2 (vy size)) 1)))

(defmethod alloy:render :around ((pass ui-pass) (hurtbox hurtbox))
  (with-pushed-matrix ()
    (apply-transforms hurtbox)
    (render hurtbox NIL)))

(defmethod alloy:render ((pass ui-pass) (hurtbox hurtbox)))

(defmethod alloy:suggest-bounds (bounds (hurtbox hurtbox)) bounds)

(defun compute-frame-location (animation frames frame-idx)
  (let ((location (vec 0 0))
        (frame (svref frames frame-idx)))
    (loop for i from (start animation) below frame-idx
          for frame = (svref frames i)
          for vel = (velocity frame)
          for offset = (v* vel (duration frame) 100)
          do (nv+ location offset))
    (nv+ location (v* (velocity frame)
                      (duration frame)
                      100 0.5))
    location))

(defmethod update-hurtbox ((sprite animatable) start end)
  (let ((start (vmin start end))
        (end (vmax start end)))
    (let* ((bsize (nvabs (nv/ (v- end start) 2)))
           (loc (nv- (v+ start bsize) (location sprite))))
      (when (and (< (vx bsize) 0.1) (< (vy bsize) 0.1))
        (setf bsize (vec 0 0))
        (setf loc (vec 0 0)))
      (setf (hurtbox (frame sprite))
            (vec (vx loc) (vy loc) (vx bsize) (vy bsize))))))

(defclass animation-editor (tool alloy:observable-object)
  ((start-pos :initform NIL :accessor start-pos)
   (timeline :initform NIL :accessor timeline)
   (paused-p :initform T :accessor paused-p)
   (hurtbox :initform (make-instance 'hurtbox) :accessor hurtbox)
   (original-location :initform NIL :accessor original-location)))

(defmethod stage :after ((editor animation-editor) (area staging-area))
  (stage (hurtbox editor) area))

(defmethod hide ((tool animation-editor))
  (when (timeline tool)
    (alloy:leave (timeline tool) T))
  (alloy:leave (hurtbox tool) T))

(defmethod label ((tool animation-editor)) "Animations")

(defmethod (setf tool) :after ((tool animation-editor) (editor editor))
  (setf (original-location tool) (vcopy (location (entity editor))))
  (setf (timeline tool) (make-instance 'timeline :ui (unit 'ui-pass T) :tool tool :entity (entity editor)))
  (alloy:enter (hurtbox tool) (alloy:popups (alloy:layout-tree (unit 'ui-pass T)))))

(define-handler (animation-editor mouse-press) (pos button)
  (when (eql button :right)
    (let ((pos (mouse-world-pos pos)))
      (setf (start-pos animation-editor) pos)
      (update-hurtbox animation-editor pos pos))))

(define-handler (animation-editor mouse-release) (pos button)
  (when (eql button :right)
    (update-hurtbox animation-editor (start-pos animation-editor) (mouse-world-pos pos))
    (setf (start-pos animation-editor) NIL)))

(define-handler (animation-editor mouse-move) (pos)
  (when (start-pos animation-editor)
    (update-hurtbox animation-editor (start-pos animation-editor) (mouse-world-pos pos))))

(defmethod update-hurtbox ((tool animation-editor) start end)
  (let ((hurtbox (update-hurtbox (entity tool) start end)))
    (setf (location (hurtbox tool)) (v+ (vxy hurtbox) (location (entity tool))))
    (setf (bsize (hurtbox tool)) (vzw hurtbox))))

(defmethod handle ((event key-release) (tool animation-editor))
  ;; FIXME: refresh frame representation in editor on change
  (let* ((entity (entity tool))
         (frame (frame entity)))
    (case (key event)
      (:space
       (setf (paused-p tool) (not (paused-p tool))))
      (:delete
       (clear frame))
      ((:a :n :left)
       (decf (frame-idx tool))
       (when (retained :shift)
         (transfer-frame (frame entity) frame)))
      ((:d :p :right)
       (incf (frame-idx tool))
       (when (retained :shift)
         (transfer-frame (frame entity) frame))))))

(defmethod frame-idx ((tool animation-editor))
  (frame-idx (entity tool)))

(defmethod (setf frame-idx) (idx (tool animation-editor))
  (let* ((sprite (entity tool))
         (animation (animation sprite)))
    (cond ((<= (end animation) idx)
           (setf idx (start animation)))
          ((< idx (start animation))
           (setf idx (1- (end animation)))))
    (setf (frame-idx sprite) idx)
    (setf (location sprite) (v+ (original-location tool)
                                (compute-frame-location animation (frames sprite) idx)))
    (let ((hurtbox (hurtbox (aref (frames sprite) idx))))
      (setf (location (hurtbox tool)) (v+ (vxy hurtbox) (location sprite)))
      (setf (bsize (hurtbox tool)) (vzw hurtbox)))))

(defmethod handle ((ev tick) (tool animation-editor))
  (unless (paused-p tool)
    (let* ((sprite (entity tool))
           (idx (frame-idx sprite))
           (frame (aref (frames sprite) idx)))
      (incf (clock sprite) (* (playback-speed sprite) (dt ev)))
      (when (<= (duration frame) (clock sprite))
        (decf (clock sprite) (duration frame))
        (incf idx (playback-direction sprite)))
      (setf (frame-idx tool) idx))))

(defmethod applicable-tools append ((_ animatable))
  '(animation-editor))

(defclass animation-chooser (alloy:combo-set)
  ())

(defclass animation-item (alloy:combo-item)
  ())

(defmethod alloy:text ((item animation-item))
  (string (name (alloy:value item))))

(defmethod alloy:combo-item (value (chooser animation-chooser))
  (make-instance 'animation-item :value value))

(defclass timeline (alloy:window alloy:observable-object)
  ((animation :accessor animation)
   (entity :initarg :entity :accessor entity)
   (tool :initarg :tool :accessor tool))
  (:default-initargs :title "Animations"
                     :extent (alloy:extent 0 30 (alloy:vw 1) 360)
                     :minimizable T
                     :maximizable NIL))

(defmethod initialize-instance :after ((timeline timeline) &key entity tool)
  (let* ((layout (make-instance 'org.shirakumo.alloy.layouts.constraint:layout))
         (focus (make-instance 'alloy:focus-list :focus-parent timeline))
         (animations (animations entity))
         (animation (alloy:represent (slot-value timeline 'animation) 'animation-chooser :value-set animations))
         (frames (make-instance 'alloy:horizontal-linear-layout :cell-margins (alloy:margins) :min-size (alloy:size 100 300)))
         (frames-focus (make-instance 'alloy:focus-list))
         (labels (make-instance 'alloy:vertical-linear-layout :cell-margins (alloy:margins 1) :elements '("Frame" "Hurtbox" "Offset" "Velocity" "Multiplier" "Knockback" "Damage" "Stun" "Interruptable" "Invincible" "Cancelable" "Effect")))
         (scroll (make-instance 'alloy:scroll-view :scroll :x :layout frames :focus frames-focus))
         (save (alloy:represent "Save" 'alloy:button))
         (toolbar (make-instance 'alloy:horizontal-linear-layout :cell-margins (alloy:margins 1) :min-size (alloy:size 50 20)))
         (speed (alloy:represent (playback-speed entity) 'alloy:wheel :step 0.1))
         (play/pause (alloy:represent "Play" 'alloy:button))
         (step-prev (alloy:represent "<" 'alloy:button))
         (step-next (alloy:represent ">" 'alloy:button)))
    (alloy:enter-all focus animation save speed step-prev play/pause step-next scroll)
    (alloy:enter-all toolbar speed step-prev play/pause step-next)
    (alloy:enter animation layout :constraints `((:left 0) (:top 0) (:width 200) (:height 20)))
    (alloy:enter save layout :constraints `((:right-of ,animation 10) (:top 0) (:width 70) (:height 20)))
    (alloy:enter toolbar layout :constraints `((:right-of ,save) (:center :x) (:top 0) (:width 300) (:height 20)))
    (alloy:enter labels layout :constraints `((:left 0) (:bottom 0) (:width 100) (:below ,animation 10)))
    (alloy:enter scroll layout :constraints `((:right-of ,labels 10) (:bottom 0) (:right 0) (:below ,animation 10)))
    (alloy:observe 'animation timeline (lambda (animation timeline)
                                         (setf (animation entity) animation)
                                         (setf (frame-idx tool) (start animation))
                                         (populate-frames frames frames-focus entity tool)))
    (alloy:observe 'paused-p tool (lambda (value tool)
                                    (setf (alloy:value play/pause) (if value "Play" "Pause"))))
    (alloy:on alloy:activate (save)
      (let ((asset (generator (texture entity))))
        (with-open-file (stream (input* asset) :direction :output :if-exists :supersede)
          (write-animation asset stream))))
    (alloy:on alloy:activate (play/pause)
      (setf (paused-p tool) (not (paused-p tool))))
    (alloy:on alloy:activate (step-prev)
      (setf (paused-p tool) T)
      (decf (frame-idx tool)))
    (alloy:on alloy:activate (step-next)
      (setf (paused-p tool) T)
      (incf (frame-idx tool)))
    (setf (animation timeline) (animation entity))
    (alloy:enter layout timeline)))

(defun populate-frames (layout focus entity tool)
  (alloy:clear layout)
  (alloy:clear focus)
  (loop for i from (start (animation entity)) below (end (animation entity))
        for frame = (aref (frames entity) i)
        for edit = (make-instance 'frame-edit :idx i :frame frame)
        do (alloy:enter edit layout)
           (alloy:enter edit focus)
           (alloy:on alloy:activate ((alloy:representation 'frame-idx edit))
             (setf (frame-idx tool) (alloy:value alloy:observable))
             (setf (paused-p tool) T))))

(alloy:define-widget frame-edit (alloy:structure)
  ((frame-idx :initarg :idx :representation (alloy:button) :reader frame-idx)
   (frame :initarg :frame :reader frame)))

(defmethod initialize-instance :after ((edit frame-edit) &key)
  (alloy:finish-structure edit (slot-value edit 'layout) (slot-value edit 'focus)))

(alloy:define-subcomponent (frame-edit hurtbox) ((hurtbox (frame frame-edit)) trial-alloy::vec4))
(alloy:define-subcomponent (frame-edit offset) ((offset (frame frame-edit)) trial-alloy::vec2 :step 1))
(alloy:define-subcomponent (frame-edit velocity) ((velocity (frame frame-edit)) trial-alloy::vec2))
(alloy:define-subcomponent (frame-edit multiplier) ((multiplier (frame frame-edit)) trial-alloy::vec2))
(alloy:define-subcomponent (frame-edit knockback) ((knockback (frame frame-edit)) trial-alloy::vec2))
(alloy:define-subcomponent (frame-edit damage) ((damage (frame frame-edit)) alloy:wheel))
(alloy:define-subcomponent (frame-edit stun) ((stun-time (frame frame-edit)) alloy:wheel :step 0.1))
(alloy:define-subcomponent (frame-edit interruptable) ((interruptable-p (frame frame-edit)) alloy:checkbox))
(alloy:define-subcomponent (frame-edit invincible) ((invincible-p (frame frame-edit)) alloy:checkbox))
(alloy:define-subcomponent (frame-edit cancelable) ((cancelable-p (frame frame-edit)) alloy:checkbox))
(alloy:define-subcomponent (frame-edit effect) ((effect (frame frame-edit)) alloy:combo-set :value-set (list* NIL (list-effects))))

(alloy:define-subcontainer (frame-edit layout)
    (alloy:vertical-linear-layout :cell-margins (alloy:margins 1) :min-size (alloy:size 100 20))
  frame-idx hurtbox offset velocity multiplier knockback damage stun interruptable invincible cancelable effect)

(alloy:define-subcontainer (frame-edit focus)
    (alloy:focus-list)
  frame-idx hurtbox offset velocity multiplier knockback damage stun interruptable invincible cancelable effect)
