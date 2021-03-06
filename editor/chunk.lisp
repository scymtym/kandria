(in-package #:org.shirakumo.fraf.kandria)

(defclass tile-button (alloy:button)
  ((tileset :initarg :tileset :accessor tileset)))

(presentations:define-realization (ui tile-button)
  ((:icon simple:icon)
   (alloy:margins)
   (tileset alloy:renderable)
   :size (alloy:px-size (/ (width (tileset alloy:renderable)) +tile-size+)
                        (/ (height (tileset alloy:renderable)) +tile-size+))))

(presentations:define-update (ui tile-button)
  (:icon
   :shift (alloy:px-point (vx alloy:value) (vy alloy:value))))

(defmethod simple:icon ((renderer ui) bounds (image texture) &rest initargs)
  (apply #'make-instance 'simple:icon :image image initargs))

(defclass tile-info (alloy:label)
  ())

(defmethod alloy:text ((info tile-info))
  (format NIL "~3d / ~3d"
          (floor (vx (alloy:value info)))
          (floor (vy (alloy:value info)))))

(defclass tile-picker (alloy:structure)
  ())

(defmethod initialize-instance :after ((structure tile-picker) &key widget)
  (let* ((tileset (albedo (entity widget)))
         (layout (make-instance 'alloy:grid-layout :cell-margins (alloy:margins 1)
                                                   :col-sizes (loop repeat (/ (width tileset) +tile-size+) collect 18)
                                                   :row-sizes (loop repeat (/ (height tileset) +tile-size+) collect 18)))
         (focus (make-instance 'alloy:focus-list))
         (scroll (make-instance 'alloy:scroll-view :scroll T :layout layout :focus focus)))
    (dotimes (y (/ (height tileset) +tile-size+))
      (dotimes (x (/ (width tileset) +tile-size+))
        (let* ((tile (vec2 x (- (/ (height tileset) +tile-size+) y 1)))
               (element (make-instance 'tile-button :data (make-instance 'alloy:value-data :value tile)
                                                    :tileset tileset :layout-parent layout :focus-parent focus)))
          (alloy:on alloy:activate (element)
            (setf (tile-to-place widget) tile)))))
    (alloy:finish-structure structure scroll scroll)))

(alloy:define-widget chunk-widget (sidebar)
  ((layer :initform +base-layer+ :accessor layer :representation (alloy:ranged-slider :range '(0 . 4) :grid 1))
   (tile :initform (vec2 1 0) :accessor tile-to-place)))

(defmethod (setf tile-to-place) :around ((tile vec2) (widget chunk-widget))
  (let* ((w (/ (width (albedo (entity widget))) +tile-size+))
         (h (/ (height (albedo (entity widget))) +tile-size+))
         (x (mod (vx tile) w))
         (y (mod (+ (vy tile) (floor (vx tile) w)) h)))
    (call-next-method (vec x y) widget)))

(alloy:define-subcomponent (chunk-widget show-solids) ((show-solids (entity chunk-widget)) alloy:switch))
(alloy:define-subobject (chunk-widget tiles) ('tile-picker :widget chunk-widget))
(alloy:define-subcomponent (chunk-widget albedo) ((slot-value chunk-widget 'tile) tile-button :tileset (albedo (entity chunk-widget))))
(alloy:define-subcomponent (chunk-widget absorption) ((slot-value chunk-widget 'tile) tile-button :tileset (absorption (entity chunk-widget))))
(alloy:define-subcomponent (chunk-widget normal) ((slot-value chunk-widget 'tile) tile-button :tileset (normal (entity chunk-widget))))
(alloy:define-subcomponent (chunk-widget tile-info) ((slot-value chunk-widget 'tile) tile-info))
(alloy::define-subbutton (chunk-widget pick) ()
  (setf (state (editor chunk-widget)) :picking))
(alloy::define-subbutton (chunk-widget clear) ()
  ;; FIXME: add confirmation
  (clear (entity chunk-widget)))
(alloy::define-subbutton (chunk-widget compute) ()
  (let ((chunk (entity chunk-widget)))
    (compute-shadow-geometry chunk T)
    (reinitialize-instance (node-graph chunk) :solids (pixel-data chunk))))

(alloy:define-subcontainer (chunk-widget layout)
    (alloy:grid-layout :col-sizes '(T) :row-sizes '(30 T 60))
  (alloy:build-ui
   (alloy:grid-layout
    :col-sizes '(T 30)
    :row-sizes '(30)
    layer show-solids))
  tiles
  (alloy:build-ui
   (alloy:grid-layout
    :col-sizes '(64 64 64 T)
    :row-sizes '(64)
    albedo absorption normal tile-info))
  (alloy:build-ui
   (alloy:grid-layout
    :col-sizes '(T T T)
    :row-sizes '(30)
    pick clear compute)))

(alloy:define-subcontainer (chunk-widget focus)
    (alloy:focus-list)
  layer show-solids tiles pick clear compute)

(defmethod (setf entity) :after ((chunk chunk) (editor editor))
  (setf (sidebar editor) (make-instance 'chunk-widget :editor editor :side :east)))

(defmethod applicable-tools append ((_ chunk))
  '(paint line))

(defmethod default-tool ((_ chunk))
  'paint)
