(defun mirror (letter)
    (concatenate 'list letter (cdr (reverse letter))))

(defun diamond (letter)
    (mirror
        (if (equal 'B letter)
            (list
                " A "
                "B B"
            )
            (list "A"))))
