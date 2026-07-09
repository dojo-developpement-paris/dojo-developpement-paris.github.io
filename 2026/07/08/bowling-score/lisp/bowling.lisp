; bowling.lisp

(defun spare-p (rolls)
    (= 10 (+ (first rolls) (first (rest rolls)))))

(defun strike-p (rolls)
    (= 10  (first rolls)))

(defun score-at-frame (frame rolls)
  (cond ((>= frame 10) 0)
        ((> (length rolls) 2)
         (let ((remaining (rest (rest rolls))))
           (cond ((spare-p rolls)
                  (+ 10
                     (first remaining)
                     (score-at-frame (1+ frame) remaining)))
                 ((strike-p rolls)
                  (+ 10
                     (first (rest rolls))
                     (first (rest (rest rolls)))
                     (score-at-frame (1+ frame) (rest rolls))))
                  (t
                    (+ (first rolls)
                     (first (rest rolls))
                     (score-at-frame (1+ frame) remaining))))))
        (t (apply #'+ rolls))))

(defun score (rolls)
  (score-at-frame 0 rolls))

(defun process ()
  (let ((num-cases (read)))
    (dotimes (i num-cases)
      (let* ((num-rolls (read))
             (rolls (loop repeat num-rolls collect (read))))
        (format t "~A~%" (score rolls))))))
