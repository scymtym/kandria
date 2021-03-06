(in-package #:org.shirakumo.fraf.kandria)

(defclass paint (tool)
  ((stroke :initform NIL :accessor stroke)))

(defmethod label ((tool paint)) "Paint")

(defmethod handle ((event mouse-press) (tool paint))
  (paint-tile tool event)
  (loop for layer across (layers (entity tool))
        for i from 0
        do (if (= i (layer (sidebar (editor tool))))
               (setf (visibility layer) 1.0)
               (setf (visibility layer) 0.5))))

(defmethod handle ((event mouse-release) (tool paint))
  (case (state tool)
    (:placing
     (setf (state tool) NIL)
     (let ((entity (entity tool)))
       (destructuring-bind (tile . stroke) (nreverse (stroke tool))
         (with-commit (tool)
           ((loop for (loc . _) in stroke
                  do (setf (tile loc entity) tile)))
           ((loop for (loc . tile) in stroke
                  do (setf (tile loc entity) tile)))))
       (setf (stroke tool) NIL))))
  (loop for layer across (layers (entity tool))
        do (setf (visibility layer) 1.0)))

(defmethod handle ((ev lose-focus) (tool paint))
  (handle (make-instance 'mouse-release :button :left :pos (or (caar (stroke tool)) (vec 0 0))) tool))

(defmethod handle ((event mouse-move) (tool paint))
  (case (state tool)
    (:placing
     (paint-tile tool event))))

(defmethod handle ((event key-press) (tool paint))
  (case (key event)
    (:1 (setf (layer (sidebar (editor tool))) 0))
    (:2 (setf (layer (sidebar (editor tool))) 1))
    (:3 (setf (layer (sidebar (editor tool))) 2))
    (:4 (setf (layer (sidebar (editor tool))) 3))
    (:5 (setf (layer (sidebar (editor tool))) 4))))

(defmethod handle ((event mouse-scroll) (tool paint))
  (let ((tile (tile-to-place (sidebar (editor tool)))))
    (setf (tile-to-place (sidebar (editor tool)))
          (if (retained :shift)
              (vec (vx tile) (+ (vy tile) (signum (delta event))))
              (vec (+ (vx tile) (signum (delta event))) (vy tile))))))

(defun paint-tile (tool event)
  (let* ((entity (entity tool))
         (loc (mouse-world-pos (pos event)))
         (loc (if (show-solids entity)
                  loc
                  (vec (vx loc) (vy loc) (layer (sidebar (editor tool))))))
         (tile (cond ((retained :left)
                      (tile-to-place (sidebar (editor tool))))
                     (T
                      (vec 0 0)))))
    (cond ((retained :control)
           (let* ((base-layer (aref (layers entity) +base-layer+))
                  (original (copy-seq (pixel-data base-layer))))
             (with-commit (tool)
               ((auto-tile entity (vxy loc)))
               ((setf (pixel-data base-layer) original)))))
          ((retained :shift)
           (let ((original (tile loc entity)))
             (with-commit (tool)
               ((flood-fill entity loc tile))
               ((flood-fill entity loc original)))))
          ((and (typep event 'mouse-press) (eql :middle (button event)))
           (setf (tile-to-place (sidebar (editor tool)))
                 (tile loc entity)))
          ((tile loc entity)
           (setf (state tool) :placing)
           (unless (stroke tool)
             (push tile (stroke tool)))
           (push (cons loc (tile loc entity)) (stroke tool))
           (setf (tile loc entity) tile)))))
