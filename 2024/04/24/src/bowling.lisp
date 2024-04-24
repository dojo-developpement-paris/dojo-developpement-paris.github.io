(defparameter STRIKE 10)

(defun is-strike (rolls)
  (eql STRIKE (car rolls))
  )

(defun is-spare (rolls)
  (eql 10 (+ (car rolls) (cadr rolls)))
  )

(defun score-at-frame (frame rolls)
  (cond 
        ((eql 0 (length rolls)) 0)

        ((eql 1 (length rolls)) (car rolls))

        ((eql 2 (length rolls)) (+ (car rolls) (cadr rolls)))

        ((eql frame 10) (+ (car rolls) (cadr rolls) (caddr rolls)))

        ((is-strike rolls)
            (+ STRIKE (cadr rolls) (caddr rolls) (score-at-frame (1+ frame) (cdr rolls))))

        ((is-spare rolls)
         (+ 10 (caddr rolls) (score-at-frame (1+ frame) (cddr rolls))))

        (t (+ (car rolls) (cadr rolls) (score-at-frame (1+ frame) (cddr rolls))))
  )
)

(defun score (rolls)
       (score-at-frame 1 rolls))
