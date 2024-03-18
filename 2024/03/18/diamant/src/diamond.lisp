(defun mirror (half-diamond)
    (concatenate 'list half-diamond (cdr (reverse half-diamond))))

(defun diamond (letter)
    (mirror
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
                (list "A")))))
