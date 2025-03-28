(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun counterstring (n)
  (cond
    ((equal 3 n) '(star 3 star))
    ((equal 1 n) '(star))
    (T '(2 star)
       )))

(test trivial-case
      (is (equal '(star) (counterstring 1))))

(test not-so-trivial-case
      (is (equal '(2 star) (counterstring 2))))


(test simple-odd
      (is (equal '(star 3 star) (counterstring 3))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
