(require :asdf)

(load "./src/diamond.lisp")

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(test diamond-a
    (is (equal '((A)) (diamond 'A))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
