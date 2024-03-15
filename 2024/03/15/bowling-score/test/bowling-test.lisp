(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(load "./src/bowling.lisp")

(test dummy
    (is (equal 4 (+ 2 2))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
