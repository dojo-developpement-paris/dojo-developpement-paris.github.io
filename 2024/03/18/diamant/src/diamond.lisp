(defun mirror (half-diamond)
    (concatenate 'list half-diamond (cdr (reverse half-diamond))))

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
            (list "A"))))

(defun diamond (letter)
    (mirror (half-diamond letter)))
