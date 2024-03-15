(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(load "./src/bowling.lisp")

(test initialy-score
    (is (equal 0 (score (list)))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
