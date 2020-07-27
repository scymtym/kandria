(in-package #:org.shirakumo.fraf.leaf)

(defclass world (pipelined-scene)
  ((packet :initarg :packet :accessor packet)
   (storyline :initarg :storyline :accessor storyline)
   (regions :initarg :regions :accessor regions)
   (handler-stack :initform () :accessor handler-stack)
   (initial-state :initform NIL :accessor initial-state)
   (time-scale :initform 1.0d0 :accessor time-scale))
  (:default-initargs
   :packet (error "PACKET required.")
   :storyline (quest:make-storyline ())
   :regions (make-hash-table :test 'eq)))

(defmethod initialize-instance :after ((world world) &key packet)
  (dolist (entry (list-entries "regions/" packet))
    (with-packet (packet packet :offset entry)
      (let ((name (getf (second (parse-sexps (packet-entry "meta.lisp" packet :element-type 'character)))
                        :name)))
        (setf (gethash name (regions world)) entry))))
  (let ((storyline (parse-sexps (packet-entry "storyline.lisp" packet :element-type 'character))))
    (setf (storyline world) (decode-payload storyline 'quest:storyline packet 'world-v0)))
  (setf (initial-state world) (minimal-load-state (entry-path "init/" packet))))

;; TODO: use spatial acceleration data structure instead.
(defmethod scan ((world world) target on-hit)
  (scan (region world) target on-hit))

(defmethod pause-game ((_ (eql T)) pauser)
  (pause-game +world+ pauser))

(defmethod unpause-game ((_ (eql T)) pauser)
  (unpause-game +world+ pauser))

(defmethod pause-game ((world world) pauser)
  (push pauser (handler-stack world)))

(defmethod unpause-game ((world world) pauser)
  (loop for handler = (pop (handler-stack world))
        until (eq handler pauser)))

(defmethod region-entry ((name symbol) (world world))
  (or (gethash name (regions world))
      (error "No such region ~s" name)))

(defmethod region-entry ((region region) (world world))
  (region-entry (name region) world))

(defmethod enter :after ((region region) (world world))
  (setf (gethash 'region (name-map world)) region)
  ;; Register region in region table if the region is new.
  (unless (gethash (name region) (regions world))
    (setf (gethash (name region) (regions world))
          (format NIL "regions/~a/" (string-downcase (name region)))))
  ;; Let everyone know we switched the region.
  (issue world 'switch-region :region region))

;; Preloading
(defmethod stage :after ((world world) (area staging-area))
  (stage (// 'leaf 'effects 'texture) area)
  (stage (// 'leaf 'effects 'vertex-array) area))

(defmethod compile-to-pass :after ((world world) (pass shader-pass))
  (register-object-for-pass pass (c2mop:ensure-finalized (find-class 'effect))))

(defmethod region ((world world))
  (gethash 'region (name-map world)))

(defmethod handle ((event event) (world world))
  (let ((handler (car (handler-stack world))))
    (if handler
        (handle event handler)
        (call-next-method))))

(defmethod handle :after ((ev quicksave) (world world))
  (save-state world :quick))

(defmethod handle :after ((ev quickload) (world world))
  (load-state :quick world))

(defmethod handle :after ((ev trial:tick) (world world))
  (when (= 0 (mod (fc ev) 10))
    (quest:try (storyline world))))

(defmethod handle :after ((ev interaction) (world world))
  (when (typep (with ev) 'interactable)
    (setf (current-dialog (unit :textbox +world+))
          (quest:dialogue (first (interactions (with ev)))))))

(defclass quest (quest:quest)
  ())

(defmethod quest:make-assembly ((_ quest))
  (make-instance 'assembly))

(defclass assembly (dialogue:assembly)
  ())

(defmethod dialogue:wrap-lexenv ((_ assembly) form)
  `(with-memo ((world +world+)
               (player (unit 'player +world+))
               (region (unit 'region +world+)))
     ,form))

(defmethod save-region (region (world world) &rest args)
  (with-packet (packet (packet world) :offset (region-entry region world)
                                      :direction :output)
    (apply #'save-region region packet args)))

(defmethod save-region (region (world (eql T)) &rest args)
  (apply #'save-region region +world+ args))

(defmethod save-region ((region (eql T)) (world world) &rest args)
  (apply #'save-region (unit 'region world) world args))

(defmethod load-region ((name symbol) (world world))
  (with-packet (packet (packet world) :offset (region-entry name world))
    (load-region packet world)))

(defmethod load-region (region (world (eql T)))
  (load-region region +world+))

(defmethod load-region ((region (eql T)) (world world))
  (load-region (name (unit 'region world)) world))

(defmethod load-region :around ((packet packet) (world world))
  (let ((old-region (unit 'region world)))
    (restart-case
        (prog1 (call-next-method)
          (when old-region
            (leave old-region world)))
      (abort ()
        :report "Give up changing the region and continue with the old."
        (when old-region
          (enter old-region world))))))
