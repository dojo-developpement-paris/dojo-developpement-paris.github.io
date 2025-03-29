(defun star ()
  "*")

(defun to-subtract (n)
  (- n (+ 2 (floor (log n 10)))))

(defun counterstring-2 (n l)
  (cond
    ((equal 0 n) (append '() l))
    ((equal 1 n) (append '(star) l))
    (T (counterstring-2 (to-subtract n) (append (cons n '(star)) l)))
    ))

(defun counterstring (n)
  (counterstring-2 n '()))

(defun output (l)
  (cond
    ((null l) "")
    ((equalp (quote star) (car l)) (concatenate 'string (star) (output (cdr l))))
    ((numberp (car l)) (concatenate 'string (write-to-string (car l)) (output (cdr l))))
    ))
