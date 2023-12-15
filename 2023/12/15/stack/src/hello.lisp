(defun empty ()
  '())

(defun check-empty (stack)
  (null stack))

(defun stack-push (value stack)
  (cons value stack))

(defun stack-size (stack)
  (length stack))

(defun stack-peek (stack)
  (car stack))

(defun stack-pop (stack)
  (cons
    (car stack)
     (cdr stack)))
