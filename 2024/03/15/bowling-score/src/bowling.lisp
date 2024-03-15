(defun score (rolls)
    ; (print rolls)
    (cond
        ((null rolls)
            ; (print "vide")
            0)
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
