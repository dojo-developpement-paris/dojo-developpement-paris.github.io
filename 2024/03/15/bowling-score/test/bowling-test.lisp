(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(load "./src/bowling.lisp")

(test initialy-score
    (is (equal 0 (score (list)))))

(test one-rolls-score-is-that-roll
    (is (equal 5 (score (list 5))))
    (is (equal 7 (score (list 7)))))

(test two-rolls-score-is-sum-of-rolls
    (is (equal 7 (score (list 3 4)))))

(test strike-score-makes-two-bonus
    (is (equal 20 (score (list 10 3 2)))))

(test ten-with-no-rolls-is-ten
    (is (equal 10 (score (list 10)))))

(test spare-score-makes-one-bonus
    (is (equal 14 (score (list 6 4 2)))))

(test last-frame
    (is (equal 30 (score (list 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10)))))

(test perfect
    (is (equal 300 (score (list 10 10 10 10 10 10 10 10 10 10 10 10)))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
