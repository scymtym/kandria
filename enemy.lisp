(in-package #:org.shirakumo.fraf.kandria)

(define-global +health-multiplier+ 1f0)

(define-shader-entity enemy (animatable)
  ((bsize :initform (vec 8.0 8.0))
   (cooldown :initform 0.0 :accessor cooldown)))

(defmethod initialize-instance :after ((enemy enemy) &key)
  (setf (health enemy) (* (health enemy) +health-multiplier+)))

(defmethod capable-p ((enemy enemy) (edge crawl-edge)) T)
(defmethod capable-p ((enemy enemy) (edge jump-edge)) T)

(defmethod handle :before ((ev tick) (enemy enemy))
  (when (path enemy)
    (handle-ai-states enemy ev)
    (return-from handle))
  (let ((collisions (collisions enemy))
        (vel (velocity enemy))
        (dt (* 100 (dt ev))))
    (nv+ vel (v* (gravity (medium enemy)) dt))
    (when (svref collisions 0) (setf (vy vel) (min 0 (vy vel))))
    (when (svref collisions 1) (setf (vx vel) (min 0 (vx vel))))
    (when (svref collisions 3) (setf (vx vel) (max 0 (vx vel))))
    (case (state enemy)
      ((:dying :animated :stunned)
       (handle-animation-states enemy ev))
      (T
       (cond ((svref collisions 2)
              (setf (vx vel) (* (vx vel) (damp* 0.9 dt)))
              (when (<= -0.1 (vx vel) 0.1)
                (setf (vx vel) 0)))
             (T
              (setf (vx vel) (* (vx vel) (damp* (p! air-dcc) dt)))))
       (handle-ai-states enemy ev)))
    (nvclamp (v- (p! velocity-limit)) vel (p! velocity-limit))
    (nv+ (frame-velocity enemy) vel)))

(defmethod handle :after ((ev tick) (enemy enemy))
  ;; Animations
  (let ((vel (velocity enemy))
        (collisions (collisions enemy)))
    (case (state enemy)
      ((:dying :animated :stunned))
      (T
       (cond ((< 0 (vx vel))
              (setf (direction enemy) +1))
             ((< (vx vel) 0)
              (setf (direction enemy) -1)))
       (cond ((< 0 (vy vel))
              (setf (animation enemy) 'jump))
             ((null (svref collisions 2))
              (setf (animation enemy) 'fall))
             ((<= 0.75 (abs (vx vel)))
              (setf (animation enemy) 'run))
             ((< 0 (abs (vx vel)))
              (setf (animation enemy) 'walk))
             (T
              (setf (animation enemy) 'stand)))))))

(defmethod collide :after ((player player) (enemy enemy) hit)
  (when (eql :dashing (state player))
    (nv+ (velocity enemy) (v* (velocity player) 0.8))
    (incf (vy (velocity enemy)) 3.0)
    (nv* (velocity player) -0.25)
    (incf (vy (velocity player)) 2.0)
    (stun player 0.27)))

(define-shader-entity ball (axis-rotated-entity moving vertex-entity textured-entity)
  ((vertex-array :initform (// 'kandria '1x))
   (texture :initform (// 'kandria 'ball))
   (bsize :initform (vec 6 6))
   (axis :initform (vec 0 0 1))))

(defmethod apply-transforms progn ((ball ball))
  (let ((size (v* 2 (bsize ball))))
    (translate-by (/ (vx size) -2) (/ (vy size) -2) 0)
    (scale (vxy_ size))))

(defmethod collides-p ((player player) (ball ball) hit)
  (eql :dashing (state player)))

(defmethod collide ((player player) (ball ball) hit)
  (nv+ (velocity ball) (v* (velocity player) 0.8))
  (incf (vy (velocity ball)) 2.0)
  (vsetf (frame-velocity player) 0 0)
  (nv* (velocity player) 0.8))

(defmethod handle :before ((ev tick) (ball ball))
  (let* ((dt (* 100 (dt ev)))
         (vel (velocity ball))
         (vlen (vlength vel)))
    (when (< 0 vlen)
      (decf (angle ball) (* 0.1 (vx vel)))
      (nv* vel (* (min vlen 10) (/ 0.99 vlen))))
    (nv+ vel (v* (gravity (medium ball)) dt))
    (nv+ (frame-velocity ball) vel)))

(defmethod collide ((ball ball) (block block) hit)
  (nv+ (location ball) (v* (frame-velocity ball) (hit-time hit)))
  (vsetf (frame-velocity ball) 0 0)
  (let ((vel (velocity ball))
        (normal (hit-normal hit))
        (loc (location ball)))
    (let ((ref (nv+ (v* 2 normal (v. normal (v- vel))) vel)))
      (vsetf vel
             (if (< (abs (vx ref)) 0.2) 0 (vx ref))
             (if (< (abs (vy ref)) 0.2) 0 (* 0.8 (vy ref)))))
    (nv+ loc (v* 0.1 normal))))

(defmethod collide :after ((ball ball) (block slope) hit)
  (let* ((loc (location ball))
         (normal (hit-normal hit))
         (xrel (/ (- (vx loc) (vx (hit-location hit))) +tile-size+)))
    (when (< (vx normal) 0) (incf xrel))
    ;; KLUDGE: we add a bias of 0.1 here to ensure we stop colliding with the slope.
    (let ((yrel (lerp (vy (slope-l block)) (vy (slope-r block)) (clamp 0f0 xrel 1f0))))
      (setf (vy loc) (+ 0.05 yrel (vy (bsize ball)) (vy (hit-location hit)))))))

(define-shader-entity balloon (game-entity lit-animated-sprite ephemeral)
  ()
  (:default-initargs
   :sprite-data (asset 'kandria 'balloon)))

(defmethod (setf animations) :after (animations (balloon balloon))
  (setf (next-animation (find 'die (animations balloon) :key #'name)) 'revive)
  (setf (next-animation (find 'revive (animations balloon) :key #'name)) 'stand))

(defmethod collides-p ((player player) (balloon balloon) hit)
  (eql 'stand (name (animation balloon))))

(defmethod collide ((player player) (balloon balloon) hit)
  (kill balloon)
  (setf (vy (velocity player)) 4.0)
  (case (state player)
    (:dashing
     (setf (vx (velocity player)) (* 1.1 (vx (velocity player)))))))

(defmethod kill ((balloon balloon))
  (setf (animation balloon) 'die))

(defmethod apply-transforms progn ((baloon balloon))
  (translate-by 0 -16 0))

(define-shader-entity dummy (enemy)
  ((bsize :initform (vec 8 16)))
  (:default-initargs
   :sprite-data (asset 'kandria 'dummy)))

(defmethod capable-p ((dummy dummy) (edge move-edge)) NIL)
(defmethod handle-ai-states ((dummy dummy) ev))
(defmethod (setf animation) ((animation symbol) (enemy dummy))
  (if (find animation '(STAND JUMP FALL LIGHT-HIT HARD-HIT DIE))
      (call-next-method)
      (call-next-method 'stand enemy)))

(define-shader-entity box (enemy solid)
  ((bsize :initform (vec 8 8))
   (health :initform 50))
  (:default-initargs
   :sprite-data (asset 'kandria 'box)))

(defmethod capable-p ((box box) (edge move-edge)) NIL)
(defmethod handle-ai-states ((box box) ev))
(defmethod (setf animation) ((animation symbol) (enemy box))
  (if (find animation '(STAND LIGHT-HIT HARD-HIT DIE))
      (call-next-method)
      (call-next-method 'stand enemy)))

(defmethod collides-p ((movable movable) (box box) hit)
  (not (eql (state box) :dying)))

(defmethod stage :after ((box box) (area staging-area))
  (stage (// 'kandria 'box-damage) area)
  (stage (// 'kandria 'box-break) area))

(defmethod hurt :after ((box box) damage)
  (harmony:play (// 'kandria 'box-damage)))

(defmethod kill :after ((box box))
  (harmony:play (// 'kandria 'box-break)))

(define-shader-entity wolf (enemy)
  ()
  (:default-initargs
   :sprite-data (asset 'kandria 'wolf)))

(defmethod movement-speed ((enemy wolf))
  (case (state enemy)
    (:crawling 0.4)
    (:normal 0.5)
    (T 2.0)))

(defmethod handle-ai-states ((enemy wolf) ev)
  (let* ((player (unit 'player T))
         (ploc (location player))
         (eloc (location enemy))
         (distance (vlength (v- ploc eloc)))
         (col (collisions enemy))
         (vel (velocity enemy)))
    (ecase (state enemy)
      ((:normal :crawling)
       (cond ;; ((< distance 400)
             ;;  (setf (state enemy) :approach))
         ((and (null (path enemy)) (<= (cooldown enemy) 0))
          (if (ignore-errors (move-to (vec (+ (vx (location enemy)) (- (random 200) 50)) (+ (vy (location enemy)) 64)) enemy))
              (setf (cooldown enemy) (+ 0.5 (expt (random 1.5) 2)))
              (setf (cooldown enemy) 0.1)))
         ((null (path enemy))
          (decf (cooldown enemy) (dt ev)))))
      (:approach (setf (state enemy) :normal))
      ;; (:approach
      ;;  ;; FIXME: This should be reached even when there is a path being executed right now.
      ;;  (cond ((< distance 200)
      ;;         (setf (path enemy) ())
      ;;         (setf (state enemy) :attack))
      ;;        ((null (path enemy))
      ;;         (ignore-errors (move-to (location player) enemy)))))
      ;; (:evade
      ;;  (if (< 100 distance)
      ;;      (setf (state enemy) :attack)
      ;;      (let ((dir (signum (- (vx eloc) (vx ploc)))))
      ;;        (when (and (svref col 2) (svref col (if (< 0 dir) 1 3)))
      ;;          (setf (vy vel) 3.2))
      ;;        (setf (vx vel) (* dir 2.0)))))
      ;; (:attack
      ;;  (cond ((< 500 distance)
      ;;         (setf (state enemy) :normal))
      ;;        ((< distance 80)
      ;;         (setf (state enemy) :evade))
      ;;        (T
      ;;         (setf (direction enemy) (signum (- (vx (location player)) (vx (location enemy)))))
      ;;         (cond ((svref col (if (< 0 (direction enemy)) 1 3))
      ;;                (setf (vy vel) 2.0)
      ;;                (setf (vx vel) (* (direction enemy) 2.0)))
      ;;               ((svref col 2)
      ;;                (setf (vy vel) 0.0)
      ;;                ;; Check that tackle would even be possible to hit (no obstacles)
      ;;                (start-animation 'tackle enemy))))))
      )))

(define-shader-entity zombie (enemy half-solid)
  ((bsize :initform (vec 4 16))
   (health :initform 100)
   (timer :initform 0.0 :accessor timer))
  (:default-initargs
   :sprite-data (asset 'kandria 'zombie)))

(defmethod stage :after ((enemy zombie) (area staging-area))
  (stage (// 'kandria 'stab) area)
  (stage (// 'kandria 'zombie-notice) area)
  (stage (// 'kandria 'explosion) area))

(defmethod movement-speed ((enemy zombie))
  (case (state enemy)
    (:stand 0.0f0)
    (:walk 0.1f0)
    (:approach 0.2f0)
    (T 1.0)))

(defmethod handle-ai-states ((enemy zombie) ev)
  (let* ((player (unit 'player T))
         (ploc (location player))
         (eloc (location enemy))
         (vel (velocity enemy)))
    (ecase (state enemy)
      (:normal
       (cond ((< (vlength (v- ploc eloc)) (* +tile-size+ 11))
              (setf (state enemy) :approach))
             (T
              (setf (state enemy) (alexandria:random-elt '(:stand :stand :walk)))
              (setf (timer enemy) (+ (ecase (state enemy) (:stand 2.0) (:walk 1.0)) (random 2.0)))
              (setf (direction enemy) (alexandria:random-elt '(-1 +1))))))
      ((:stand :walk)
       (when (< (vlength (v- ploc eloc)) (* +tile-size+ 10))
         (start-animation 'notice enemy))
       (when (<= (decf (timer enemy) (dt ev)) 0)
         (setf (state enemy) :normal))
       (case (state enemy)
         (:stand (setf (vx vel) 0))
         (:walk (setf (vx vel) (* (direction enemy) (movement-speed enemy))))))
      (:approach
       (cond ((< (* +tile-size+ 20) (vlength (v- ploc eloc)))
              (setf (state enemy) :normal))
             ((< (abs (- (vx ploc) (vx eloc))) (* +tile-size+ 1))
              (start-animation 'attack enemy))
             (T
              (setf (direction enemy) (floor (signum (- (vx ploc) (vx eloc)))))
              (setf (vx vel) (* (direction enemy) (movement-speed enemy)))))))))

(defmethod hit ((enemy zombie) location)
  (trigger 'spark enemy :location (v+ location (vrand -4 +4))))
