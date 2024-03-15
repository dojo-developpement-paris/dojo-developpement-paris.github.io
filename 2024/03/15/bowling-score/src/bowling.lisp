(defun is-spare (rolls)
    (eql 10 (+ (car rolls) (cadr rolls))))

(defun is-strike (rolls)
    (eql 10 (car rolls)))

(defun bonus (rolls)
    (+
        (car rolls)
        (cadr rolls)
        (caddr rolls)))

(defun score (rolls)
    ; (print rolls)
    (cond
        ((> (length rolls) 18)
            30)
        ((< (length rolls) 3)
            ; (print "smaller than 3")
            (apply #'+ rolls))
        ((is-spare rolls)
            ; (print "spare")
            (+
                (bonus rolls)
                (score (cddr rolls))))
        ((is-strike rolls)
            ; (print "strike")
            (+
                (bonus rolls)
                (score (cdr rolls))))
        (T
            ; (print "normal")
            (+
                (car rolls)
                (cadr rolls)
                (score (cddr rolls))))))


; def score(rolls):
;     print(rolls)
;     if not rolls:
;         return 0
;     else:
;         return rolls[0] + score(rolls[1:])
