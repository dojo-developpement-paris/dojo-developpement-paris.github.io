
(defun mystery-container (key)
  nil)

(defun peek (container key)
    (funcall container key))

(defun poke (container key value)
  (lambda (k)
    (if (equalp k key)
        value
        (funcall container k))))
