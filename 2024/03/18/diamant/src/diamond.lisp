(defun mirror (pattern)
    (concatenate 'list pattern (cdr (reverse pattern))))

(defun string-reverse-and-cdr (line)
    (coerce (cdr (reverse (coerce line 'list))) 'string))

(defun mirror-line (pattern)
    (concatenate 'string pattern (string-reverse-and-cdr pattern)))

(defun half-diamond (letter)
    (cond
        ((equal 'C letter)
            (mapcar #'mirror-line (list
                "  A"
                " B "
                "C  ")))
        ((equal 'B letter)
            (mapcar #'mirror-line (list
                " A"
                "B ")))
        (T
            (list "A"))))

(defun diamond (letter)
    (mirror (half-diamond letter)))
