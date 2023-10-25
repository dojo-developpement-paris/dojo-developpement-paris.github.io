

(defun nb-diffs (x y)
  (if (equalp "" x)
        0
        (if (equalp (char x 0) (char y 0))
              (nb-diffs (subseq x 1) (subseq y 1))
              (+ 1 (nb-diffs (subseq x 1) (subseq y 1))))))


(defun adjacentp (x y)
    (= 1 (nb-diffs x y)))

; version iterative utilisant la réaffectation de variable (beurk)
; (defun adjacentp (x y)
;     (progn (setf diffs 0) 
;            (dotimes (i (length x)) 
;              (when (not (equalp (char x i) (char y i))) 
;                 (setf diffs (+ 1 diffs))))
;            (equalp 1 diffs)))
; 

