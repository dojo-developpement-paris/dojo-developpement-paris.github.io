(defun adjacent (source target)
    (let ((list-source (coerce source 'list))
          (list-target (coerce target 'list)))
        (equal 1 (differences list-source list-target))))

(defun differences (source target)
    (cond
        ((null source)
            0)
        ((equalp (car source) (car target))
            (differences (cdr source) (cdr target)))
        (t
            (+ 1 (differences (cdr source) (cdr target))))))

(defun adjacents (dictionnary word)
    (remove-if-not (lambda (w) (adjacent word w)) dictionnary))

(defun chemins (dictionnary word)
    (let ((mots (adjacents dictionnary word)))
        (mapcar (lambda (w) (list w word)) mots)))

(defun ladder (dictionnary source target)
    (list "dog" "cog" "cot" "cat"))
