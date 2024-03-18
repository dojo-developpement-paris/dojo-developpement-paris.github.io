(require :asdf)

(load "./src/diamond.lisp")

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(test diamond-a
    (is (equal (list "A") (diamond 'A))))

(test diamond-b
    (is (equal (list
        " A "
        "B B"
        " A "
    ) (diamond 'B))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
