(defun mirror (pattern)
    (concatenate 'list pattern (cdr (reverse pattern))))

(defun string-reverse-and-cdr (line)
    (coerce (cdr (reverse (coerce line 'list))) 'string))

(defun mirror-line (pattern)
    (concatenate 'string pattern (string-reverse-and-cdr pattern)))

(defun size (letter)
    (1+ (-
        (char-code (car (coerce (string letter) 'list)))
        (char-code #\A))))

(defun letter-index-to-string (letter-index)
    (string (code-char (+ letter-index (char-code #\A)))))

(defun diagonal-line (letter-index size)
    (concatenate 'string "  " (letter-index-to-string letter-index) ""))

(defun diagonal (letter)
    (cond
        ((equal 'C letter)
            (list
                (diagonal-line 0 3)
                (concatenate 'string " " "B" " ")
                (concatenate 'string "" "C" "  ")))
        ((equal 'B letter)
            (list
                " A"
                "B "))
        (T
            (list
                (coerce (list #\A) 'string)))))

(defun half-diamond (letter)
    (mapcar #'mirror-line (diagonal letter)))

(defun diamond (letter)
    (mirror (half-diamond letter)))
