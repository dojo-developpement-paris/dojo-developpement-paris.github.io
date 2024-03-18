(defun mirror (truc)
    (concatenate 'list truc (cdr (reverse truc))))

(defun diamond (letter)
    (if (equal 'B letter)
        (mirror
            (list
                " A "
                "B B"
            )
        )
        (mirror (list "A"))))
