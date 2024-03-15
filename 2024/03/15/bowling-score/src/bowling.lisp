(defun score (rolls)
    (cond
        ((null rolls)
            0)
        ((eql 10 (car rolls))
            (+
                10
                (cadr rolls)
                (caddr rolls)
                (score (cdr rolls))))
        (T
            (+
                (car rolls)
                (score (cdr rolls))))))


; def score(rolls):
;     print(rolls)
;     if not rolls:
;         return 0
;     else:
;         return rolls[0] + score(rolls[1:])
