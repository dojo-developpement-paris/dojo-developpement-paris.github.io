(defun mirror (pattern)
    (concatenate 'list pattern (cdr (reverse pattern))))

(defun toto ()
    "A")

(defun half-diamond (letter)
    (cond
        ((equal 'C letter)
            (list
                "  A  "
                " B B "
                "C   C"
            ))
        ((equal 'B letter)
            (list
                " A "
                "B B"
            ))
        (T
            (list (toto)))))

(defun diamond (letter)
    (mirror (half-diamond letter)))
