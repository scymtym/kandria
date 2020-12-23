(in-package #:org.shirakumo.fraf.kandria)

(define-shader-entity layer (lit-entity sized-entity resizable ephemeral)
  ((vertex-array :initform (// 'trial 'fullscreen-square) :accessor vertex-array)
   (tilemap :accessor tilemap)
   (layer-index :initarg :layer-index :initform 0 :accessor layer-index)
   (visibility :initform 1.0 :accessor visibility)
   (albedo :initarg :albedo :initform (// 'kandria 'debug) :accessor albedo)
   (absorption :initarg :absorption :initform (// 'kandria 'debug) :accessor absorption)
   (normal :initarg :normal :initform (// 'kandria 'debug) :accessor normal)
   (size :initarg :size :initform +tiles-in-view+ :accessor size
         :type vec2 :documentation "The size of the chunk in tiles."))
  (:inhibit-shaders (shader-entity :fragment-shader)))

(defmethod initialize-instance :after ((layer layer) &key pixel-data tile-data)
  (let* ((size (size layer))
         (data (or pixel-data
                   (make-array (floor (* (vx size) (vy size) 2))
                               :element-type '(unsigned-byte 8)))))
    (setf (bsize layer) (v* size +tile-size+ .5))
    (setf (tilemap layer) (make-instance 'texture :target :texture-2d
                                                  :width (floor (vx size))
                                                  :height (floor (vy size))
                                                  :pixel-data data
                                                  :pixel-type :unsigned-byte
                                                  :pixel-format :rg-integer
                                                  :internal-format :rg8ui
                                                  :min-filter :nearest
                                                  :mag-filter :nearest))
    (setf (albedo layer) (resource tile-data 'albedo))
    (setf (absorption layer) (resource tile-data 'absorption))
    (setf (normal layer) (resource tile-data 'normal))))

(defmethod stage ((layer layer) (area staging-area))
  (stage (vertex-array layer) area)
  (stage (tilemap layer) area)
  (stage (albedo layer) area)
  (stage (absorption layer) area)
  (stage (normal layer) area))

(defmethod pixel-data ((layer layer))
  (pixel-data (tilemap layer)))

(defmethod (setf pixel-data) ((data vector) (layer layer))
  (replace (pixel-data (tilemap layer)) data)
  (update-layer layer))

(defmethod resize ((layer layer) w h)
  (let ((size (vec2 (floor w +tile-size+) (floor h +tile-size+))))
    (unless (v= size (size layer))
      (setf (size layer) size))))

(defmethod (setf size) :around (value (layer layer))
  ;; Ensure the size is never lower than a screen.
  (call-next-method (vmax value +tiles-in-view+) layer))

(defmethod (setf size) :before (value (layer layer))
  (let* ((nw (floor (vx2 value)))
         (nh (floor (vy2 value)))
         (ow (floor (vx2 (size layer))))
         (oh (floor (vy2 (size layer))))
         (tilemap (pixel-data layer))
         (new-tilemap (make-array (* 4 nw nh) :element-type '(unsigned-byte 8)
                                              :initial-element 0)))
    ;; Allocate resized and copy data over. Slow!
    (dotimes (y (min nh oh))
      (dotimes (x (min nw ow))
        (let ((npos (* 2 (+ x (* y nw))))
              (opos (* 2 (+ x (* y ow)))))
          (dotimes (c 2)
            (setf (aref new-tilemap (+ npos c)) (aref tilemap (+ opos c)))))))
    ;; Resize the tilemap. Internal mechanisms should take care of re-mapping the pixel data.
    (when (gl-name (tilemap layer))
      (setf (pixel-data (tilemap layer)) new-tilemap)
      (resize (tilemap layer) nw nh))))

(defmethod (setf size) :after (value (layer layer))
  (setf (bsize layer) (v* value +tile-size+ .5)))

(defmacro %with-layer-xy ((layer location) &body body)
  (alexandria:once-only (location layer)
    (alexandria:with-unique-names (llocation bsize size)
      `(let* ((,llocation (location ,layer))
              (,bsize (bsize ,layer))
              (,size (size ,layer))
              (x (floor (+ (- (the sf (vx ,location)) (the sf (vx2 ,llocation))) (the sf (vx2 ,bsize))) +tile-size+))
              (y (floor (+ (- (the sf (vy ,location)) (the sf (vy2 ,llocation))) (the sf (vy2 ,bsize))) +tile-size+)))
         (when (and (< -1.0f0 x (the sf (vx2 ,size)))
                    (< -1.0f0 y (the sf (vy2 ,size))))
           ,@body)))))

(defmethod tile ((location vec2) (layer layer))
  (%with-layer-xy (layer location)
    (let ((pos (* 2 (+ x (* y (truncate (vx (size layer)))))))
          (pixel-data (pixel-data layer)))
      (declare (type (simple-array (unsigned-byte 8) 1) pixel-data)
               (type alexandria:array-index pos))
      (vec2 (aref pixel-data pos) (aref pixel-data (1+ pos))))))

(defmethod (setf tile) (value (location vec2) (layer layer))
  (%with-layer-xy (layer location)
    (let ((dat (pixel-data layer))
          (pos (* 2 (+ x (* y (truncate (vx (size layer)))))))
          (texture (tilemap layer)))
      (when (or (/= (vx value) (aref dat (+ 0 pos)))
                (/= (vy value) (aref dat (+ 1 pos))))
        (setf (aref dat (+ 0 pos)) (truncate (vx2 value)))
        (setf (aref dat (+ 1 pos)) (truncate (vy2 value)))
        (sb-sys:with-pinned-objects (dat)
          (gl:bind-texture :texture-2d (gl-name texture))
          (%gl:tex-sub-image-2d :texture-2d 0 x y 1 1 (pixel-format texture) (pixel-type texture)
                                (cffi:inc-pointer (sb-sys:vector-sap dat) pos))
          (gl:bind-texture :texture-2d 0)))
      value)))

(defun update-layer (layer)
  (let ((dat (pixel-data layer)))
    (sb-sys:with-pinned-objects (dat)
      (let ((texture (tilemap layer))
            (width (truncate (vx (size layer))))
            (height (truncate (vy (size layer)))))
        (gl:bind-texture :texture-2d (gl-name texture))
        (%gl:tex-sub-image-2d :texture-2d 0 0 0 width height
                              (pixel-format texture) (pixel-type texture)
                              (sb-sys:vector-sap dat))
        (gl:bind-texture :texture-2d 0)))))

(defmethod clear ((layer layer))
  (let ((dat (pixel-data layer)))
    (dotimes (i (truncate (* 2 (vx (size layer)) (vy (size layer)))))
      (setf (aref dat i) 0))
    (update-layer layer)))

(defmethod flood-fill ((layer layer) (location vec2) fill)
  (%with-layer-xy (layer location)
    (let* ((width (truncate (vx (size layer))))
           (height (truncate (vy (size layer)))))
      (%flood-fill (pixel-data layer) width height x y fill)
      (update-layer layer))))

(defmethod render ((layer layer) (program shader-program))
  (when (in-view-p (location layer) (bsize layer))
    (setf (uniform program "visibility") (visibility layer))
    (setf (uniform program "view_size") (vec2 (width *context*) (height *context*)))
    (setf (uniform program "map_size") (size layer))
    (setf (uniform program "map_position") (location layer))
    (setf (uniform program "view_matrix") (minv *view-matrix*))
    (setf (uniform program "model_matrix") (minv *model-matrix*))
    (setf (uniform program "tilemap") 0)
    ;; TODO: Could optimise by merging absorption with normal, absorption being in the B channel.
    ;;       Then could merge albedo and absorption into one texture array to minimise draw calls.
    (setf (uniform program "albedo") 1)
    (setf (uniform program "absorption") 2)
    (setf (uniform program "normal") 3)
    (gl:active-texture :texture0)
    (gl:bind-texture :texture-2d (gl-name (tilemap layer)))
    (gl:active-texture :texture1)
    (gl:bind-texture :texture-2d (gl-name (albedo layer)))
    (gl:active-texture :texture2)
    (gl:bind-texture :texture-2d (gl-name (absorption layer)))
    (gl:active-texture :texture3)
    (gl:bind-texture :texture-2d (gl-name (normal layer)))
    (gl:bind-vertex-array (gl-name (vertex-array layer)))
    (unwind-protect
         (%gl:draw-elements :triangles (size (vertex-array layer)) :unsigned-int 0)
      (gl:bind-vertex-array 0))))

(define-class-shader (layer :vertex-shader)
  "layout (location = 0) in vec3 vertex;
layout (location = 1) in vec2 vertex_uv;
uniform mat4 view_matrix;
uniform mat4 model_matrix;
uniform vec2 view_size;
out vec2 map_coord;
out vec2 world_pos;

void main(){
  // We start in view-space, so we have to inverse-map to world-space.
  vec4 _position = view_matrix * vec4(vertex_uv*view_size, 0, 1);
  world_pos = _position.xy;
  map_coord = (model_matrix * _position).xy;
  gl_Position = vec4(vertex, 1);
}")

(define-class-shader (layer :fragment-shader)
  "
uniform usampler2D tilemap;
uniform sampler2D albedo;
uniform sampler2D absorption;
uniform sampler2D normal;
uniform vec2 map_size;
uniform vec2 map_position;
uniform int tile_size = 16;
uniform float visibility = 1.0;
in vec2 map_coord;
in vec2 world_pos;
out vec4 color;

void main(){
  ivec2 map_wh = ivec2(map_size)*tile_size;
  ivec2 map_xy = ivec2(map_coord+map_wh/2.);

  // Calculate tilemap index and pixel offset within tile.
  ivec2 tile_xy  = ivec2(map_xy.x / tile_size, map_xy.y / tile_size);
  ivec2 pixel_xy = ivec2(map_xy.x % tile_size, map_xy.y % tile_size);

  // Look up tileset index from tilemap and pixel from tileset.
  uvec2 tile = texelFetch(tilemap, tile_xy, 0).rg;
  tile_xy = ivec2(tile)*tile_size+pixel_xy;
  color = texelFetch(albedo, tile_xy, 0);
  float a = texelFetch(absorption, tile_xy, 0).r;
  vec2 n = texelFetch(normal, tile_xy, 0).rg-0.5;
  if(abs(n.x) < 0.1 && abs(n.y) < 0.1)
    n = vec2(0);
  else
    n = normalize(n);
  color = apply_lighting(color, vec2(0), 1-a, n, world_pos) * visibility;
}")

(define-shader-entity chunk (shadow-caster layer solid ephemeral)
  ((layer-index :initform (1- +layer-count+))
   (layers :accessor layers)
   (node-graph :accessor node-graph)
   (show-solids :initform NIL :accessor show-solids)
   (tile-data :initarg :tile-data :accessor tile-data
              :type tile-data :documentation "The tile data used to display the chunk.")
   (background :initform (background 'debug) :initarg :background :accessor background
               :type background-info :documentation "The background to show in the chunk.")
   (gi :initform (gi 'none) :initarg :gi :accessor gi
       :type gi-info :documentation "The lighting to show in the chunk.")
   (name :initform (generate-name "CHUNK")))
  (:default-initargs :tile-data (asset 'kandria 'debug)))

(defmethod initialize-instance :after ((chunk chunk) &key (layers (make-list +layer-count+)) tile-data)
  (let* ((size (size chunk))
         (layers (loop for i from 0
                       for data in layers
                       collect (make-instance 'layer :size size
                                                     :location (location chunk)
                                                     :tile-data tile-data
                                                     :pixel-data data
                                                     :layer-index i))))
    (setf (layers chunk) (coerce layers 'vector))
    #++
    (setf (node-graph chunk) (make-instance 'node-graph :size size
                                                        :solids (pixel-data chunk)
                                                        :offset (v- (location chunk) (bsize chunk))))
    (register-generation-observer chunk tile-data)))

(defmethod observe-generation ((chunk chunk) (data tile-data) result)
  (compute-shadow-geometry chunk T))

(defmethod compile-to-pass ((chunk chunk) (pass shader-pass))
  (call-next-method)
  #++(compile-to-pass (node-graph chunk) pass))

(defmethod compile-into-pass :after ((chunk chunk) container (pass shader-pass))
  (loop for layer across (layers chunk)
        do (compile-into-pass layer container pass)))

(defmethod render :around ((chunk chunk) (program shader-program))
  (cond ((show-solids chunk)
         (setf (visibility chunk) 1.0)
         (call-next-method))
        ((find-panel 'editor)
         (setf (visibility chunk) 0.3)
         (call-next-method))))

(defmethod enter :after ((chunk chunk) (container container))
  (loop for layer across (layers chunk)
        do (enter layer container)))

(defmethod leave :after ((chunk chunk) (container container))
  (loop for layer across (layers chunk)
        do (leave layer container)))

(defmethod stage :after ((chunk chunk) (area staging-area))
  (loop for layer across (layers chunk)
        do (stage layer area))
  (stage (background chunk) area)
  #++(stage (node-graph chunk) area))

(defmethod clone ((chunk chunk) &rest initargs)
  (apply #'make-instance (class-of chunk)
         (append initargs
                 (list
                  :size (clone (size chunk))
                  :tile-data (tile-data chunk)
                  :pixel-data (clone (pixel-data chunk))
                  :layers (mapcar #'clone (map 'list #'pixel-data (layers chunk)))
                  :background (background chunk)
                  :gi (gi chunk)))))

(defmethod (setf size) :after (size (chunk chunk))
  (loop for layer across (layers chunk)
        do (setf (size layer) size)))

(defmethod (setf location) :around (location (chunk chunk))
  (let ((diff (v- location (location chunk))))
    (for:for ((entity over (region +world+)))
      (when (contained-p entity chunk)
        (nv+ (location entity) diff)))
    (call-next-method)))

(defmethod (setf location) :after (location (chunk chunk))
  (loop for layer across (layers chunk)
        do (setf (location layer) location)))

(defmethod clear :after ((chunk chunk))
  (loop for layer across (layers chunk)
        do (clear layer)))

(defmethod (setf tile-data) :after ((data tile-data) (chunk chunk))
  (let ((area (make-instance 'staging-area)))
    (stage (resource data 'albedo) area)
    (stage (resource data 'absorption) area)
    (stage (resource data 'normal) area)
    (trial:commit area (loader (handler *context*)) :unload NIL))
  (flet ((update-layer (layer)
           (setf (albedo layer) (resource data 'albedo))
           (setf (absorption layer) (resource data 'absorption))
           (setf (normal layer) (resource data 'normal))))
    (update-layer chunk)
    (map NIL #'update-layer (layers chunk))))

(defmethod (setf background) :after ((data background-info) (chunk chunk))
  (trial:commit data (loader (handler *context*)) :unload NIL))

(defmethod tile ((location vec3) (chunk chunk))
  (tile (vxy location) (aref (layers chunk) (floor (vz location)))))

(defmethod (setf tile) :around (value (location vec2) (chunk chunk))
  (when (= 0 (vy value))
    (call-next-method)))

(defmethod (setf tile) (value (location vec3) (chunk chunk))
  (setf (tile (vxy location) (aref (layers chunk) (floor (vz location)))) value))

(defmethod flood-fill ((chunk chunk) (location vec3) fill)
  (flood-fill (aref (layers chunk) (floor (vz location))) (vxy location) fill))

(defmethod entity-at-point (point (chunk chunk))
  (or (call-next-method)
      (when (contained-p point chunk)
        chunk)))

(defmethod auto-tile ((chunk chunk) (location vec2))
  (auto-tile chunk (vec (vx location) (vy location) +base-layer+)))

(defmethod auto-tile ((chunk chunk) (location vec3))
  (%with-layer-xy (chunk location)
    (let* ((z (truncate (vz location)))
           (width (truncate (vx (size chunk))))
           (height (truncate (vy (size chunk)))))
      (%auto-tile (pixel-data chunk)
                  (pixel-data (aref (layers chunk) z))
                  width height x y (tile-types (tile-data chunk)))
      (update-layer (aref (layers chunk) z)))))

(defmethod compute-shadow-geometry ((chunk chunk) (vbo vertex-buffer))
  (let* ((w (truncate (vx (size chunk))))
         (h (truncate (vy (size chunk))))
         (layer (pixel-data (aref (layers chunk) +base-layer+)))
         (info (tile-types (generator (albedo chunk))))
         (data (buffer-data vbo)))
    ;; TODO: Optimise the lines by merging them together whenever possible
    (labels ((tile (x y)
               (let ((x (aref layer (+ 0 (* 2 (+ x (* y w))))))
                     (y (aref layer (+ 1 (* 2 (+ x (* y w)))))))
                 (loop for (type . tiles) in info
                       for found = (loop for (_x _y) in tiles
                                         thereis (and (= x _x) (= y _y)))
                       do (when found (return type))))))
      (setf (fill-pointer data) 0)
      (dotimes (y h)
        (dotimes (x w)
          (flet ((line (xa ya xb yb)
                   (let ((x (+ 8 (* (- x (/ w 2)) +tile-size+)))
                         (y (+ 8 (* (- y (/ h 2)) +tile-size+))))
                     (add-shadow-line vbo (vec (+ x xa) (+ y ya)) (vec (+ x xb) (+ y yb))))))
            (let ((tile (tile x y)))
              ;; Surface tiles
              (case* tile
                ((:t :h :tl> :tr> :bl< :br<) (line -8 +8 +8 +8))
                ((:r :v :tr> :br> :tl< :bl<) (line +8 -8 +8 +8))
                ((:b :h :br> :bl> :tl< :tr<) (line -8 -8 +8 -8))
                ((:l :v :tl> :bl> :tr< :br<) (line -8 -8 -8 +8)))
              ;; Slopes
              (when (and (listp tile) (eql :slope (first tile)))
                (let ((t-info (aref +surface-blocks+ (+ 4 (second tile)))))
                  (line (vx (slope-l t-info)) (vy (slope-l t-info)) (vx (slope-r t-info)) (vy (slope-r t-info)))))
              ;; Edge caps
              (when tile
                (cond ((= x 0)      (line -8 -8 -8 +8))
                      ((= x (1- w)) (line +8 -8 +8 +8)))
                (cond ((= y 0)      (line -8 -8 +8 -8))
                      ((= y (1- h)) (line -8 +8 +8 +8)))))))))))

(defmethod shortest-path ((chunk chunk) (start vec2) (goal vec2) &rest args &key test)
  (declare (ignore test))
  (flet ((local-pos (pos)
           (vfloor (nv+ (v- pos (location chunk)) (bsize chunk)) +tile-size+)))
    (apply #'shortest-path (node-graph chunk) (local-pos start) (local-pos goal) args)))

(defmethod shortest-path ((chunk chunk) (start sized-entity) goal &key test)
  (shortest-path chunk (location start) goal :test (or test (lambda (edge) (capable-p start edge)))))

(defmethod contained-p ((entity located-entity) (chunk chunk))
  (contained-p (location entity) chunk))

(defmethod contained-p ((location vec2) (chunk chunk))
  (%with-layer-xy (chunk location)
    chunk))

(defmethod scan ((chunk chunk) (target vec2) on-hit)
  (let ((tile (tile target chunk)))
    (when (and tile (= 0 (vy tile)) (< 0 (vx tile)))
      (let ((hit (make-hit (aref +surface-blocks+ (truncate (vx tile))) target)))
        (unless (funcall on-hit hit)
          hit)))))

(deftype sf ()
  '(single-float -100000.0f0 100000.0f0))

(defmethod scan ((chunk chunk) (target vec4) on-hit)
  (check-type on-hit function)
  (let* ((loc (location chunk))
         (size (size chunk))
         (bsize (bsize chunk))
         (dx (- (vx loc) (vx bsize)))
         (dy (- (vy loc) (vy bsize)))
         (tilemap (the (simple-array (unsigned-byte 8) 1) (pixel-data chunk)))
         (t-s +tile-size+)
         (t-s/2 (/ t-s 2))
         (w (truncate (the sf (vx size))))
         (h (truncate (the sf (vy size))))
         (lloc (nv+ (nv- (vxy target) loc) bsize))
         (vx-lloc (vx lloc)) (vy-lloc (vy lloc))
         (vz-target (vz target)) (vw-target (vw target))
         (x- (floor (- vx-lloc vz-target) t-s))
         (x+ (ceiling (+ vx-lloc vz-target) t-s))
         (y- (floor (- vy-lloc vw-target) t-s))
         (y+ (ceiling (+ vy-lloc vw-target) t-s)))
    (declare (type sf vx-lloc vy-lloc vz-target vw-target))
    (loop for x from (max 0 x-) below (min w x+)
          for x*t-s = (* x t-s)
          do (loop for y from (max 0 y-) below (min h y+)
                   for idx = (* (+ x (* y w)) 2)
                   for tile = (aref tilemap (+ 0 idx))
                   do (when (< 0 tile)
                        (let* ((loc (vec2 (+ x*t-s t-s/2 dx) (+ (* y t-s) t-s/2 dy)))
                               (hit (make-hit (aref +surface-blocks+ tile) loc)))
                          (unless (funcall on-hit hit)
                            (return-from scan hit))))))))

(defmethod scan ((chunk chunk) (target game-entity) on-hit)
  (declare (type function on-hit))
  (let* ((tilemap (pixel-data chunk))
         (location (location chunk))
         (size (size chunk))
         (bsize (bsize chunk))
         (t-s +tile-size+)
         (ts/2 (/ t-s 2))
         (dx (+ ts/2 (- (vx location) (vx bsize))))
         (dy (+ ts/2 (- (vy location) (vy bsize))))
         (x- 0) (y- 0) (x+ 0) (y+ 0)
         (w (truncate (vx size)))
         (h (truncate (vy size)))
         (size (v+ (bsize target) ts/2))
         (pos (location target))
         (lloc (nv+ (v- pos location) bsize))
         (vel (frame-velocity target)))
    (declare (type (simple-array (unsigned-byte 8) 1) tilemap))
    ;; Figure out bounding region
    (if (< 0 (vx vel))
        (setf x- (floor (- (vx lloc) (vx size)) t-s)
              x+ (ceiling (+ (vx lloc) (vx vel) (vx size)) t-s))
        (setf x- (floor (- (+ (vx lloc) (vx vel)) (vx size)) t-s)
              x+ (ceiling (+ (vx lloc) (vx size)) t-s)))
    (if (< 0 (vy vel))
        (setf y- (floor (- (vy lloc) (vy size)) t-s)
              y+ (ceiling (+ (vy lloc) (vy vel) (vy size)) t-s))
        (setf y- (floor (- (+ (vy lloc) (vy vel)) (vy size)) t-s)
              y+ (ceiling (+ (vy lloc) (vy size)) t-s)))
    ;; Sweep AABB through tiles
    (locally (declare (type fixnum x- x+ y- y+))
      (loop for x from (max x- 0) to (min x+ (1- w))
            do (loop for y from (max y- 0) to (min y+ (1- h))
                     for idx = (* (+ x (* y w)) 2)
                     for tile = (aref tilemap (+ 0 idx))
                     do (when (and (< 0 tile)
                                   (= 0 (aref tilemap (+ 1 idx))))
                          (let* ((loc (vec2 (+ (* x t-s) dx)
                                            (+ (* y t-s) dy)))
                                 (hit (aabb pos vel loc size)))
                            (when hit
                              (setf (hit-object hit) (aref +surface-blocks+ tile))
                              (unless (funcall on-hit hit)
                                (return-from scan hit))))))))))
