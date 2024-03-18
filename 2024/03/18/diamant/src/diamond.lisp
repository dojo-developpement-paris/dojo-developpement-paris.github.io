(defun mirror (truc muche)
    (concatenate 'list truc (cdr (reverse truc))))

(defun diamond (letter)
    (if (equal 'B letter)
        (mirror
            (list
                " A "
                "B B"
            )
            (list
                "B B"
                " A "
            )
        )
        (list "A")))
