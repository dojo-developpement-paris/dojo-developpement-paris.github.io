(require :asdf)

(require "lisp-unit" "~/.local/share/common-lisp/source/lisp-unit.lisp")
; set up testing options
(in-package :lisp-unit)
(setq *print-failures* t)
(load "./src/bowling.lisp")

(define-test dummy
    (assert-equal 4 (+ 3 2)))

(run-tests :all)
