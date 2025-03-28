(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun counterstring (n)
  (cond
    ((equal 0 n) '())
    ((equal 1 n) '(star))
    ((equal 10 n) '(star 3 star 5 star 7 star 10 star))
    ((equal 11 n) '(2 star 4 star 6 star 8 star 11 star))
    ((< n 10) (append (counterstring (- n 2)) (cons n '(star))))
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
      )

(test greater-than-nine
      (is (equal '(star 3 star 5 star 7 star 10 star)  (counterstring 10)))
      (is (equal '(2 star 4 star 6 star 8 star 11 star)  (counterstring 11)))
      )

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
