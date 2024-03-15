(defun score (rolls)
    (if (null rolls)
        0
        (+
            (car rolls)
            (score (cdr rolls)))))


; def score(rolls):
;     print(rolls)
;     if not rolls:
;         return 0
;     else:
;         return rolls[0] + score(rolls[1:])
