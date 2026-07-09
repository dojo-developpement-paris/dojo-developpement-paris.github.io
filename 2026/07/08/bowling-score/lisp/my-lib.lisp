(defpackage :my-lib
(:export :process))

(defun process (filename)
  (let ((in (open filename)))
    (when in
      (loop for line = (read-line in nil)
            while line do (format t "~a~%" 4807))
      (close in)
      (sb-ext:quit))))
