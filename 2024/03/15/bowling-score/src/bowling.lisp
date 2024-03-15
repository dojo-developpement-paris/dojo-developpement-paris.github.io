(defun is-spare (rolls)
    (eql 10 (+ (car rolls) (cadr rolls))))

(defun is-strike (rolls)
    (eql 10 (car rolls)))

(defun bonus (rolls)
    (+
        (car rolls)
        (cadr rolls)
        (caddr rolls)))

(defun score-at-frame (frame rolls)
    (cond
        ((or (eql 10 frame) (< (length rolls) 3))
            (apply #'+ rolls))
        ((is-spare rolls)
            (+
                (bonus rolls)
                (score-at-frame (1+ frame) (cddr rolls))))
        ((is-strike rolls)
            (+
                (bonus rolls)
                (score-at-frame (1+ frame) (cdr rolls))))
        (T
            (+
                (car rolls)
                (cadr rolls)
                (score-at-frame (1+ frame) (cddr rolls))))))


(defun score (rolls)
    (score-at-frame 1 rolls))

; def score(rolls):
;     print(rolls)
;     if not rolls:
;         return 0
;     else:
;         return rolls[0] + score(rolls[1:])
