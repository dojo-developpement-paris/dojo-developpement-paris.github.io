(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun counterstring (n)
  '(star))

(test trivial-case
      (is (equal '(star) (counterstring 1))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
