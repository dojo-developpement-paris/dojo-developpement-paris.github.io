(defun mirror (pattern)
    (concatenate 'list pattern (cdr (reverse pattern))))

(defun string-reverse-and-cdr (line)
    (coerce (cdr (reverse (coerce line 'list))) 'string))

(defun half-diamond (letter)
    (cond
        ((equal 'C letter)
            (list
                (concatenate 'string "  A" (string-reverse-and-cdr "  A"))
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
