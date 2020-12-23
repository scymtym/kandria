(in-package #:org.shirakumo.fraf.kandria)

(declaim (type (integer 1 256) +tile-size+))
(define-global +tile-size+ 16)
(define-global +layer-count+ 6)
(define-global +base-layer+ 2)
(define-global +tiles-in-view+ (vec2 40 26))
(define-global +world+ NIL)
(define-global +input-source+ :keyboard)

(defmethod version ((_ (eql :kandria)))
  #.(flet ((file (p)
             (merge-pathnames p (pathname-utils:to-directory (or *compile-file-pathname* *load-pathname*))))
           (trim (s)
             (string-trim '(#\Return #\Linefeed #\Space) s)))
      (let* ((head (trim (alexandria:read-file-into-string (file ".git/HEAD"))))
             (path (subseq head (1+ (position #\  head))))
             (commit (trim (alexandria:read-file-into-string (file (merge-pathnames path ".git/"))))))
        (format NIL "~a-~a"
                (asdf:component-version (asdf:find-system "kandria"))
                (subseq commit 0 7)))))

(defun root ()
  (if (deploy:deployed-p)
      (deploy:runtime-directory)
      (pathname-utils:to-directory #.(or *compile-file-pathname* *load-pathname*))))

(defun config-directory ()
  (trial:config-directory "shirakumo" "kandria"))

(defun format-absolute-time (&optional (time (get-universal-time)))
  (multiple-value-bind (s m h dd mm yy) (decode-universal-time time 0)
    (format NIL "~4,'0d.~2,'0d.~2,'0d ~2,'0d:~2,'0d:~2,'0d" yy mm dd h m s)))

(defun maybe-finalize-inheritance (class)
  (let ((class (etypecase class
                 (class class)
                 (symbol (find-class class)))))
    (unless (c2mop:class-finalized-p class)
      (c2mop:finalize-inheritance class))
    class))

(defun mktab (&rest entries)
  (let ((table (make-hash-table :size (length entries))))
    (loop for (key val) in entries
          do (setf (gethash key table) val))
    table))

(defmacro with-kandria-io-syntax (&body body)
  `(with-standard-io-syntax
     (let ((*package* #.*package*)
           (*print-case* :downcase)
           (*print-readably* NIL))
       ,@body)))

(defmacro with-memo (bindings &body body)
  (let ((funs (loop for binding in bindings
                    collect (cons (car binding) (gensym (string (car binding)))))))
    `(let ,(mapcar #'car bindings)
       (flet ,(loop for (var value) in bindings
                    for fun = (cdr (assoc var funs))
                    collect `(,fun ()
                                   (or ,var (setf ,var ,value))))
         (declare (ignorable ,@(loop for fun in funs collect (list 'function (cdr fun)))))
         (symbol-macrolet ,(loop for binding in bindings
                                 for fun = (cdr (assoc (car binding) funs))
                                 collect `(,(car binding) (,fun)))
           ,@body)))))

(defun find-new-directory (dir base)
  (loop for i from 0
        for sub = dir then (format NIL "~a-~d" dir i)
        for path = (pathname-utils:subdirectory base sub)
        do (unless (uiop:directory-exists-p path)
             (return path))))

(defun parse-sexps (string)
  (with-kandria-io-syntax
    (loop with eof = (make-symbol "EOF")
          with i = 0
          collect (multiple-value-bind (data next) (read-from-string string NIL EOF :start i)
                    (setf i next)
                    (if (eql data EOF)
                        (loop-finish)
                        data)))))

(defun princ* (expression &optional (stream *standard-output*))
  (with-kandria-io-syntax
    (write expression :stream stream :case :downcase)
    (fresh-line stream)))

(defun type-tester (type)
  (lambda (object) (typep object type)))

(define-compiler-macro type-tester (&whole whole type &environment env)
  (if (constantp type env)
      `(lambda (o) (typep o ,type))
      whole))

(defun type-prototype (type)
  (case type
    (character #\Nul)
    (complex #c(0 0))
    (cons '(NIL . NIL))
    (float 0.0)
    (function #'identity)
    (hash-table (load-time-value (make-hash-table)))
    (integer 0)
    (null NIL)
    (package #.*package*)
    (pathname #p"")
    (random-state (load-time-value (make-random-state)))
    (readtable (load-time-value (copy-readtable)))
    (stream (load-time-value (make-broadcast-stream)))
    (string "string")
    (symbol '#:symbol)
    (vector #(vector))
    (T (let ((class (find-class type)))
         (unless (c2mop:class-finalized-p class)
           (c2mop:finalize-inheritance class))
         (c2mop:class-prototype class)))))

(defmethod unit (thing (target (eql T)))
  (when +world+
    (unit thing +world+)))

(defun vrand (min max)
  (vec (+ min (random (- max min)))
       (+ min (random (- max min)))))

(defun vrandr (min max)
  (let ((r (+ min (random (- max min))))
        (phi (random (* 2 PI))))
    (vec (* r (cos phi))
         (* r (sin phi)))))

(defun nvalign (vec grid)
  (vsetf vec
         (* grid (floor (+ (vx vec) (/ grid 2)) grid))
         (* grid (floor (+ (vy vec) (/ grid 2)) grid))))

(defun vfloor (vec &optional (divisor 1))
  (vapply vec floor divisor divisor divisor divisor))

(defun vsqrlen2 (a)
  (declare (type vec2 a))
  (declare (optimize speed))
  (+ (expt (vx2 a) 2)
     (expt (vy2 a) 2)))

(defun vsqrdist2 (a b)
  (declare (type vec2 a b))
  (declare (optimize speed))
  (+ (expt (- (vx2 a) (vx2 b)) 2)
     (expt (- (vy2 a) (vy2 b)) 2)))

(defun mindist (pos candidates)
  (loop for candidate in candidates
        minimize (vdistance pos candidate)))

(defun closer (a b dir)
  (< (abs (v. a dir)) (abs (v. b dir))))

(defun invclamp (low mid high)
  (cond ((< mid low) 0.0)
        ((< high mid) 1.0)
        (T (/ (- mid low) (- high low)))))

(defun absinvclamp (low mid high)
  (* (signum mid) (invclamp low (abs mid) high)))

(defun point-angle (point)
  (atan (vy point) (vx point)))

(defun intersection-point (a as b bs)
  (let ((l (max (- (vx2 a) (vx2 as))
                (- (vx2 b) (vx2 bs))))
        (r (min (+ (vx2 a) (vx2 as))
                (+ (vx2 b) (vx2 bs))))
        (b (max (- (vy2 a) (vy2 as))
                (- (vy2 b) (vy2 bs))))
        (u (min (+ (vy2 a) (vy2 as))
                (+ (vy2 b) (vy2 bs)))))
    (vec2 (/ (+ l r) 2)
          (/ (+ b u) 2))))

(defun update-instance-initforms (class)
  (flet ((update (instance)
           (loop for slot in (c2mop:class-direct-slots class)
                 for name = (c2mop:slot-definition-name slot)
                 for init = (c2mop:slot-definition-initform slot)
                 when init do (setf (slot-value instance name) (eval init)))))
    (when (window :main NIL)
      (for:for ((entity over (scene (window :main))))
        (when (typep entity class)
          (update entity))))))

(defun initarg-slot (class initarg)
  (let ((class (etypecase class
                 (class class)
                 (symbol (find-class class)))))
    (find (list initarg) (c2mop:class-slots class)
          :key #'c2mop:slot-definition-initargs
          :test #'subsetp)))

(defmethod parse-string-for-type (string type)
  (read-from-string string))

(defmethod parse-string-for-type (string (type (eql 'vec2)))
  (with-input-from-string (stream string)
    (vec2 (read stream) (read stream))))

(defmethod parse-string-for-type (string (type (eql 'vec3)))
  (with-input-from-string (stream string)
    (vec3 (read stream) (read stream) (read stream))))

(defmethod parse-string-for-type (string (type (eql 'asset)))
  (with-input-from-string (stream string)
    (asset (read stream) (read stream) T)))

(defmethod parse-string-for-type :around (string type)
  (let ((value (call-next-method)))
    (with-new-value-restart (value) (new-value "Specify a new value")
      (unless (typep value type)
        (error 'type-error :expected-type type :datum value)))
    value))

(defclass solid () ())
(defclass half-solid (solid) ())
(defclass resizable () ())

(defstruct (hit (:constructor make-hit (object location &optional (time 0f0) (normal (vec 0 0)))))
  (object NIL)
  (location NIL :type vec2)
  (time 0f0 :type single-float)
  (normal NIL :type vec2))

;; Scan through TARGET to find REGION. When a match is found, invoke ON-HIT
;; with a HIT instance. If ON-HIT returns true, the scan continues, otherwise
;; the HIT instance is returned.
(defgeneric scan (target region on-hit))
;; Similar to SCAN, but checks whether a HIT is valid through COLLIDES-P, and
;; returns the closest HIT instance, if any.
(defgeneric scan-collision (target region))
;; Should return T if the HIT should actually be counted as a valid collision.
(defgeneric collides-p (object tested hit))
;; Returns T if TARGET is contained in THING.
(defgeneric contained-p (target thing))

(defmethod contained-p ((point vec2) (rect vec4))
  (and (<= (- (vx4 rect) (vz4 rect)) (vx2 point) (+ (vx4 rect) (vz4 rect)))
       (<= (- (vy4 rect) (vw4 rect)) (vy2 point) (+ (vy4 rect) (vw4 rect)))))

(defmethod contained-p ((a vec4) (b vec4))
  (and (< (abs (- (vx a) (vx b))) (+ (vz a) (vz b)))
       (< (abs (- (vy a) (vy b))) (+ (vw a) (vw b)))))

(defmethod scan (target region on-hit))
(defmethod collides-p (object target hit) NIL)
(defmethod collides-p (object (target solid) hit) T)

(defgeneric classify-hit-object (object)
  (:method ((object solid))
    nil)
  (:method ((object t))
    t))

(defmethod scan-collision (target region)
  (scan target region (lambda (hit)
                        (classify-hit-object (hit-object hit)))))

;; Handle common collision operations. Uses SCAN-COLLISION to find the closest
;; valid HIT, then invokes COLLIDE using that hit, if any. Returns the closest
;; HIT, if any.
(defun handle-collisions (target object)
  (let ((hit (scan-collision target object)))
    (when hit
      (collide object (hit-object hit) hit)
      hit)))

;; Handle response to a collision of OBJECT with the TESTED entity on HIT.
;; HIT-OBJECT of the HIT instance must be EQ to TESTED.
(defgeneric collide (object tested hit))

(defmethod entity-at-point (point thing)
  NIL)

(defmethod entity-at-point (point (container flare:container))
  (or (call-next-method)
      (for:for ((result as NIL)
                (entity over container)
                (at-point = (entity-at-point point entity)))
        (when (and at-point
                   ;; FIXME: this is terrible
                   (typep entity '(or chunk (not layer)))
                   (or (null result)
                       (< (vlength (bsize at-point))
                          (vlength (bsize result)))))
          (setf result at-point)))))

(defmethod contained-p (thing target)
  (scan target thing (constantly NIL)))

(defun find-containing (thing container)
  (for:for ((entity over container))
    (when (and (typep entity 'chunk)
               (contained-p thing entity))
      (return entity))))

(defgeneric clone (thing &key &allow-other-keys))

(defmethod clone (thing &key)
  thing)

(defmethod clone ((vec vec2) &key) (vcopy2 vec))
(defmethod clone ((vec vec3) &key) (vcopy3 vec))
(defmethod clone ((vec vec4) &key) (vcopy4 vec))
(defmethod clone ((mat mat2) &key) (mcopy2 mat))
(defmethod clone ((mat mat3) &key) (mcopy3 mat))
(defmethod clone ((mat mat4) &key) (mcopy4 mat))
(defmethod clone ((mat matn) &key) (mcopyn mat))

(defmethod clone ((cons cons) &key)
  (cons (clone (car cons)) (clone (cdr cons))))

(defmethod clone ((array array) &key)
  (if (array-has-fill-pointer-p array)
      (make-array (array-dimensions array)
                  :element-type (array-element-type array)
                  :adjustable (adjustable-array-p array)
                  :fill-pointer (fill-pointer array)
                  :initial-contents array)
      (make-array (array-dimensions array)
                  :element-type (array-element-type array)
                  :adjustable (adjustable-array-p array)
                  :initial-contents array)))

(defmethod clone ((entity entity) &rest initargs)
  (let ((initvalues ()))
    (loop for initarg in (initargs entity)
          for slot = (initarg-slot (class-of entity) initarg)
          do (push (clone (slot-value entity (c2mop:slot-definition-name slot))) initvalues)
             (push initarg initvalues))
    (apply #'make-instance (class-of entity) (append initargs initvalues))))

(defun mouse-world-pos (pos)
  (let ((camera (unit :camera T)))
    (let ((pos (nv+ (v/ pos (view-scale camera) (zoom camera)) (location camera))))
      (nv- pos (v/ (target-size camera) (zoom camera))))))

(defun world-screen-pos (pos)
  (let ((camera (unit :camera T)))
    (let ((pos (v+ pos (v/ (target-size camera) (zoom camera)))))
      (v* (nv- pos (location camera)) (view-scale camera) (zoom camera)))))

(defun mouse-tile-pos (pos)
  (nvalign (mouse-world-pos (v- pos (/ +tile-size+ 2))) +tile-size+))

(defun generate-name (&optional indicator)
  (intern (format NIL "~a-~d" (or indicator "ENTITY") (incf *gensym-counter*)) #.*package*))

(defclass request-region (event)
  ((region :initarg :region :reader region)))

(defclass switch-region (event)
  ((region :initarg :region :reader region)))

(defclass switch-chunk (event)
  ((chunk :initarg :chunk :reader chunk)))

(defclass change-time (event)
  ((hour :initarg :hour :reader hour)))

(defun switch-chunk (chunk)
  (issue +world+ 'switch-chunk :chunk chunk))

(defclass force-lighting (event)
  ())

(defclass unpausable () ())

(defclass ephemeral (entity)
  ((flare:name :initform (generate-name))))

(define-shader-entity player () ())
(define-shader-entity enemy () ())

(defmacro call (func-ish &rest args)
  (let* ((slash (position #\/ (string func-ish)))
         (package (subseq (string func-ish) 0 slash))
         (symbol (subseq (string func-ish) (1+ slash)))
         (symbolg (gensym "SYMBOL")))
    `(let ((,symbolg (find-symbol ,symbol ,package)))
       (if ,symbolg
           (funcall ,symbolg ,@args)
           (error "No such symbol ~a:~a" ,package ,symbol)))))

(defmacro error-or (&rest cases)
  (let ((id (gensym "BLOCK")))
    `(cl:block ,id
       ,@(loop for case in cases
               collect `(ignore-errors
                         (return-from ,id ,case))))))

(defmacro case* (thing &body cases)
  (let ((thingg (gensym "THING")))
    `(let ((,thingg ,thing))
       ,@(loop for (test . body) in cases
               for tests = (enlist test)
               collect `(when (or ,@(loop for test in tests
                                          collect `(eql ,test ,thingg)))
                          ,@body)))))

(defun cycle-list (list)
  (let ((first (pop list)))
    (if list
        (setf (cdr (last list)) (list first))
        (setf list (list first)))
    (values list first)))
