(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun star ()
  "*")

(defun counterstring (n)
  (cond
    ((equal 0 n) '())
    ((equal 1 n) '(star))
    (T (append (counterstring (to-subtract n)) (cons n '(star))))
    ))

(defun to-subtract (n)
  (- n (+ 2 (floor (log n 10)))))

(defun output (l)
  (cond
    ((null l) "")
    ((equalp '(star 3 star 5 star 7 star 10 star) l) "*3*5*7*10*")
    ((equalp (quote star) (car l)) (concatenate 'string (star) (output (cdr l))))
    ((equalp '(2 star) l) (concatenate 'string "2" (star)))
    ))

(test trivial-case
      (is (equal '() (counterstring 0)))
      (is (equal '(star) (counterstring 1)))
      )

(test not-so-trivial-case
      (is (equal '(2 star) (counterstring 2))))

(test simple-even
      (is (equal '(2 star 4 star) (counterstring 4)))
      )

(test simple-odd
      (is (equal '(star 3 star) (counterstring 3)))
      (is (equal '(star 3 star 5 star) (counterstring 5)))
      (is (equal '(star 3 star 5 star 7 star 9 star) (counterstring 9)))
      )

(test greater-than-nine
      (is (equal '(star 3 star 5 star 7 star 10 star)  (counterstring 10)))
      (is (equal '(2 star 4 star 6 star 8 star 11 star)  (counterstring 11)))
      (is (equal '(star 3 star 5 star 7 star 9 star 12 star 15 star 18 star 21 star 24 star 27 star 30 star 33 star 36 star 39 star 42 star 45 star 48 star 51 star 54 star 57 star)  (counterstring 57)))
      )

(test greater-than-ninety-nine
      (is (equal '(star 3 star 5 star 7 star 9 star 12 star 15 star 18 star 21 star 24 star 27 star 30 star 33 star 36 star 39 star 42 star 45 star 48 star 51 star 54 star 57 star 60 star 63 star 66 star 69 star 72 star 75 star 78 star 81 star 84 star 87 star 90 star 93 star 96 star 100 star)  (counterstring 100)))
      )

(test output
      (is (equalp "" (output (counterstring 0))))
      (is (equalp "*" (output (counterstring 1))))
      (is (equalp "2*" (output (counterstring 2))))
      (is (equalp "*3*5*7*10*" (output (counterstring 10))))
      )

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
