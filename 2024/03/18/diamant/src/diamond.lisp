(defun mirror (pattern)
    (concatenate 'list pattern (cdr (reverse pattern))))

(defun string-reverse-and-cdr (line)
    (coerce (cdr (reverse (coerce line 'list))) 'string))

(defun mirror-line (pattern)
    (concatenate 'string pattern (string-reverse-and-cdr pattern)))

(defun half-diamond (letter)
    (cond
        ((equal 'C letter)
            (list
                (mirror-line "  A")
                (concatenate 'string " B " (string-reverse-and-cdr " B "))
                (concatenate 'string "C  " (string-reverse-and-cdr "C  "))
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
