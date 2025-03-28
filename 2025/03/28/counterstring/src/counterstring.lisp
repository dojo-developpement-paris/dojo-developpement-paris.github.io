(defun star ()
  "*")

(defun to-subtract (n)
  (- n (+ 2 (floor (log n 10)))))

(defun counterstring (n)
  (cond
    ((equal 0 n) '())
    ((equal 1 n) '(star))
    (T (append (counterstring (to-subtract n)) (cons n '(star))))
    ))

(defun output (l)
  (cond
    ((null l) "")
    ((equalp (quote star) (car l)) (concatenate 'string (star) (output (cdr l))))
    ((numberp (car l)) (concatenate 'string (write-to-string (car l)) (output (cdr l))))
    ))
