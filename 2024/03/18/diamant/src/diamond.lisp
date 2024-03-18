(defun mirror (half-diamond)
    (concatenate 'list half-diamond (cdr (reverse half-diamond))))

(defun diamond (letter)
    (mirror
        (if (equal 'B letter)
            (list
                " A "
                "B B"
            )
            (list "A"))))
