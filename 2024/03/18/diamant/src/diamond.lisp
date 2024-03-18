(defun mirror (pattern)
    (concatenate 'list pattern (cdr (reverse pattern))))

(defun toto (line)
    (cond
        ((eql 2 line)
            " A ")
        (T
            "A")))

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
                (toto 2)
                "B B"
            ))
        (T
            (list (toto 1)))))

(defun diamond (letter)
    (mirror (half-diamond letter)))
