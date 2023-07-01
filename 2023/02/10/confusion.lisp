(defvar *x* 3)
(defun foo (x) (+ x 1))

;; (solve 53 8) => (5 3)
;; 

(defun solve (equation result) 
  (let* ((remainder (mod equation 10))
         (tens (floor equation 10))
         (unit (cons remainder nil)))
    (cond ((= equation 0) nil)
          ((= equation result) (cons equation nil))
          (t (append (solve tens (- result remainder)) unit))
      )
    )
  )

(format T "~d : (solve 53 8) == (5 3)~d ~%" (equal '(5 3) (solve 53 8))(solve 53 8))
(format T "~d : (solve 21 3) == (2 1)~%" (equal '(2 1) (solve 21 3)))
(format T "~d : (solve 214 7) == (2 1 4)~%" (equal '(2 1 4) (solve 214 7)))
(format T "~d : (solve 1111 4) == (1 1 1 1)~%" (equal '(1 1 1 1) (solve 1111 4)))
(format T "~d : (solve 214 25) == (21 4)~%" (equal '(21 4) (solve 214 25)))
(format T "~d : (solve 214 16) == (2 14)~%" (equal '(2 14) (solve 214 16)))

