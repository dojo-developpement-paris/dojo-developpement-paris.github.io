(ql:quickload :lisp-unit)
(in-package :lisp-unit)
(setq *print-failures* t)
(load "bowling")

(define-test no-rolls-then-score-is-zero
    (assert-equal 0 (score ())))

(define-test one-average-roll-then-score-is-roll
             (assert-equal 4 (score (list 4))))

(define-test two-average-rolls-then-score-is-sum-of-rolls
             (assert-equal 5 (score (list 3 2))))


(define-test spare-counts-new-roll-as-a-bonus
             (assert-equal 12 (score (list 6 4 1)))
             (assert-equal 16 (score (list 7 3 3))))

(define-test strike-adds-next-two-rolls-as-bonus
            (assert-equal 30 (score (list 10 5 5))))

(define-test strike-on-a-partial-game-cannot-be-counted
             (assert-equal 20 (score (list 10 10))))

(define-test after-ten-frames-no-bonus-is-added
             (assert-equal 300 (score (list 10 10 10 10 10 10 10 10 10 10 10 10)))
             (assert-equal 50 (score (list 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 10)))
             (assert-equal 150 (score (list 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5)))
             )

(run-tests :all)
(sb-ext:quit)
