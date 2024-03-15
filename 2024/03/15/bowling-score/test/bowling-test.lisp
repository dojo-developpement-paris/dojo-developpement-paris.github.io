(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(load "./src/bowling.lisp")

(test initialy-score
    (is (equal 0 (score (list)))))

(test one-rolls-score-is-that-roll
    (is (equal 5 (score (list 5)))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
