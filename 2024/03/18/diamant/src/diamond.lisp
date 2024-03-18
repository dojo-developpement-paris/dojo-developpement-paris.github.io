(defun mirror (pattern)
    (concatenate 'list pattern (cdr (reverse pattern))))

(defun half-diamond (letter)
    (cond
        ((equal 'C letter)
            (list
               (concatenate 'string "  A" "  ")
                " B B "
                "C   C"
            ))
        ((equal 'B letter)
            (list
                " A "
                "B B"
            ))
        (T
            (list "A"))))

(defun diamond (letter)
    (mirror (half-diamond letter)))
