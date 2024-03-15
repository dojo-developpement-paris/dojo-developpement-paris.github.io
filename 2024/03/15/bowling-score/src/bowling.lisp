(defun score (rolls)
    ; (print rolls)
    (cond
        ((null rolls)
            ; (print "vide")
            0)
        ((< (length rolls) 3)
            (apply #'+ rolls))
        ((eql 10 (car rolls))
            ; (print "strike")
            (+
                10
                (cadr rolls)
                (caddr rolls)
                (score (cdr rolls))))
        (T
            ; (print "normal")
            (+
                (car rolls)
                (score (cdr rolls))))))


; def score(rolls):
;     print(rolls)
;     if not rolls:
;         return 0
;     else:
;         return rolls[0] + score(rolls[1:])
