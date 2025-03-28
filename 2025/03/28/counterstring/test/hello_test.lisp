(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun counterstring (n)
  (cond
    ((equal 1 n) '(star))
    ((equal 2 n) '(2 star))
    ((equal 4 n) '(2 star 4 star))
    ((oddp n) (append (counterstring (- n 2)) (cons n '(star))))
    ))

(test trivial-case
      (is (equal '(star) (counterstring 1))))

(test not-so-trivial-case
      (is (equal '(2 star) (counterstring 2))))

(test simple-even
      (is (equal '(2 star 4 star) (counterstring 4)))
      )

(test simple-odd
      (is (equal '(star 3 star) (counterstring 3)))
      (is (equal '(star 3 star 5 star) (counterstring 5)))
      )

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
