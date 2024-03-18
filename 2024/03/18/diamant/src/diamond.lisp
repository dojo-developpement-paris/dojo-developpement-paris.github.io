(defun mirror (truc)
    (concatenate 'list truc (cdr (reverse truc))))

(defun diamond (letter)
    (mirror
        (if (equal 'B letter)
            (list
                " A "
                "B B"
            )
            (list "A"))))
