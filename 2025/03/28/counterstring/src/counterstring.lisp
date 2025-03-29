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

(defun output-2 (l acc)
  (cond
    ((null l) (concatenate 'string "" acc))
    ((equalp (quote star) (car l)) (output-2 (cdr l) (concatenate 'string acc (star))))
    ((numberp (car l)) (output-2 (cdr l) (concatenate 'string acc (write-to-string (car l)))))
    ))

(defun output (l)
  (output-2 l ""))
