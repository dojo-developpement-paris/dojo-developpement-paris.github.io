(ql:quickload :lisp-unit)
(in-package :lisp-unit)
(setq *print-failures* t)
(load "dispenser")

(defparameter *d* (new-dispenser (list 23 17 4807 3 12 256 100 1017 5)))
(define-test find-first-on-predicate
             (let ((threshold 10))
              (assert-equal 3 (first-item *d* (lambda (n) (< n threshold)))))

               (assert-equal 4807 (first-item *d* (lambda (n) (> n 100))))
               (assert-equal 256 (next-item *d*))
               (assert-equal 1017 (next-item *d*))
               (assert-equal nil (next-item *d*))

               (assert-equal 3 (first-item *d* (lambda (n) (= 0 (mod n 3)))))
               (assert-equal 12 (next-item *d*))
               (assert-equal 1017 (next-item *d*))
               (assert-equal nil (next-item *d*))

               (assert-equal 12 (first-item *d* #'evenp))
               (assert-equal 256 (next-item *d*))
               (assert-equal 100 (next-item *d*))
               (assert-equal nil (next-item *d*))
               )

(run-tests :all)
(sb-ext:quit)
