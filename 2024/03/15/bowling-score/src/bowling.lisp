(defun is-spare (rolls)
    (eql 10 (+ (car rolls) (cadr rolls))))

(defun is-strike (rolls)
    (eql 10 (car rolls)))

(defun score (rolls)
    ; (print rolls)
    (cond
        ((< (length rolls) 3)
            (apply #'+ rolls))
        ((is-spare rolls)
            ; (print "spare")
            (+
                10
                (caddr rolls)
                (score (cddr rolls))))
        ((is-strike rolls)
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
