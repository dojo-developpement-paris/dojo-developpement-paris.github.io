(require :asdf)
(require :lisp-unit)
(in-package :lisp-unit)
(setq *print-failures* t)
(load "src/bowling")

(define-test given-one-roll-score-is-that-roll
    (assert-equal 7 (score (list 7)))
    (assert-equal 0 (score (list 0)))
)

(define-test given-two-rolls-score-is-the-sum-of-rolls
    (assert-equal 8 (score (list 5 3)))
    (assert-equal 6 (score (list 2 4)))
)

(define-test given-a-strike-the-next-two-rolls-count-as-bonus
    (assert-equal 24 (score (list STRIKE 3 4)))
    (assert-equal 16 (score (list STRIKE 1 2)))
)

(define-test given-3-average-rolls-score-is-sum-of-rolls
    (assert-equal 12 (score (list 7 2 3)))
    )

(define-test given-a-spare-the-next-rolls-counts-as-bonus
    (assert-equal 14 (score (list 5 5 2)))
)

(define-test after-ten-frames-rolls-dont-generate-bonuses
    (assert-equal 300 (score (list 10 10 10 10 10 10 10 10 10 10 10 10)))
    )

(run-tests :all)
(sb-ext:quit)
