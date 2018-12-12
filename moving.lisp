(in-package #:org.shirakumo.fraf.leaf)

(define-subject moving (game-entity)
  ((collisions :initform (make-array 4) :reader collisions)))

(defmethod scan (entity target))

(defmethod tick ((moving moving) ev)
  (let* ((scene +level+)
         (loc (location moving))
         (vel (velocity moving))
         (size (bsize moving)))
    ;; Scan for hits until we run out of velocity or hits.
    (fill (collisions moving) NIL)
    (loop while (and (or (/= 0 (vx vel)) (/= 0 (vy vel)))
                     (scan scene moving)))
    ;; Remaining velocity (if any) can be added safely.
    (nv+ loc vel)
    ;; Point test for adjacent walls
    (let ((tl (scan scene (vec (- (vx loc) (vx size) 1) (+ (vy loc) (vy size) -1))))
          (bl (scan scene (vec (- (vx loc) (vx size) 1) (- (vy loc) (vy size) -1))))
          (tr (scan scene (vec (+ (vx loc) (vx size) 1) (+ (vy loc) (vy size) -1))))
          (br (scan scene (vec (+ (vx loc) (vx size) 1) (- (vy loc) (vy size) -1))))
          (b  (scan scene (vec (vx loc) (- (vy loc) (vy size) 1)))))
      (when (or tl bl) (setf (aref (collisions moving) 3) (or tl bl)))
      (when (or tr br) (setf (aref (collisions moving) 1) (or tr br)))
      (when b (setf (aref (collisions moving) 2) b)))
    ;; Point test for interactables. Pretty stupid.
    (let ((m (scan scene loc)))
      (with-simple-restart (decline "")
        (when (and m (not (eq m moving)))
          (collide moving m (make-hit m 0.0 loc (vec 0 0))))))))

(defmethod collide ((moving moving) (block ground) hit)
  (let* ((loc (location moving))
         (vel (velocity moving))
         (pos (hit-location hit))
         (normal (hit-normal hit))
         (height (vy (bsize moving)))
         (t-s (/ (block-s block) 2)))
    (cond ((= +1 (vy normal)) (setf (svref (collisions moving) 2) block))
          ((= -1 (vy normal)) (setf (svref (collisions moving) 0) block))
          ((= +1 (vx normal)) (setf (svref (collisions moving) 3) block))
          ((= -1 (vx normal)) (setf (svref (collisions moving) 1) block)))
    (nv+ loc (v* vel (hit-time hit)))
    (nv- vel (v* normal (v. vel normal)))
    ;; Zip out of ground in case of clipping
    (cond ((and (/= 0 (vy normal))
                 (< (vy pos) (vy loc))
                 (< (- (vy loc) height)
                    (+ (vy pos) t-s)))
           (setf (vy loc) (+ (vy pos) t-s height)))
          ((and (/= 0 (vy normal))
                (< (vy loc) (vy pos))
                (< (- (vy pos) t-s)
                   (+ (vy loc) height)))
           (setf (vy loc) (- (vy pos) t-s height))))))

(defmethod collide ((moving moving) (block platform) hit)
  (let* ((loc (location moving))
         (vel (velocity moving))
         (pos (hit-location hit))
         (normal (hit-normal hit))
         (height (vy (bsize moving)))
         (t-s (/ (block-s block) 2)))
    (unless (and (= 1 (vy normal))
                 (<= (+ (vy pos) (/ t-s 2)) (- (vy loc) height)))
      (decline))
    (setf (svref (collisions moving) 2) block)
    (nv+ loc (v* vel (hit-time hit)))
    (nv- vel (v* normal (v. vel normal)))
    ;; Zip
    (when (< (- (vy loc) height)
             (+ (vy pos) t-s))
      (setf (vy loc) (+ (vy pos) t-s height)))))

(defmethod collide ((moving moving) (block spike) hit)
  (die moving)
  (decline))

(defmethod collide ((moving moving) (block slope) hit)
  (let* ((loc (location moving))
         (vel (velocity moving))
         (pos (hit-location hit))
         (height (vy (bsize moving)))
         (t-s (/ (block-s block) 2))
         (l (slope-l block))
         (r (slope-r block)))
    (decline)
    ;; FIXME: slopes lol
    ))

(defvar *recursive-check* NIL)
(defmethod collide ((moving moving) (platform moving-platform) hit)
  (let* ((loc (location moving))
         (pos (location platform))
         (vel (velocity moving))
         (normal (hit-normal hit)))
    (cond ((= +1 (vy normal)) (setf (svref (collisions moving) 2) platform))
          ((= -1 (vy normal)) (setf (svref (collisions moving) 0) platform))
          ((= +1 (vx normal)) (setf (svref (collisions moving) 3) platform))
          ((= -1 (vx normal)) (setf (svref (collisions moving) 1) platform)))
    (nv+ loc (v* vel (hit-time hit)))
    (nv- vel (v* normal (v. vel normal)))
    ;; Recursive collisions mean we're being squashed
    (when *recursive-check*
      (die moving)
      (decline))
    ;; Move along platform while scanning for hits
    (let ((vel (vcopy2 (velocity platform)))
          (*recursive-check* T))
      (setf (velocity moving) vel)
      (loop while (and (or (/= 0 (vx vel)) (/= 0 (vy vel)))
                       (scan +level+ moving)))
      (nv+ loc vel))
    (setf (velocity moving) vel)
    ;; Zip onto ground if standing
    (when (= 1 (vy normal))
      (setf (vy loc) (+ (vy pos) (vy (bsize moving)) (vy (bsize platform)))))))

(define-handler (moving post-tick) (ev)
  ;; Compensate for block movement
  (let ((b (svref (collisions moving) 2)))
    (when (typep b 'moving-platform)
      (setf (vy (location moving)) (+ (vy (location b)) (vy (bsize moving)) (vy (bsize b)))))))
