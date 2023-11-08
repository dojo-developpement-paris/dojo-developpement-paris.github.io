(ql:quickload "fiveam")
(in-package :fiveam)
(def-suite* mystery-container)

(load "./src/mystery-container.lisp")

(test initially-container-is-empty
      (is (equalp nil 
          (peek #'mystery-container "foo"))))

(test after-storing-a-value-the-value-can-be-retrieved
      (is (equal 17
          (peek 
                (poke #'mystery-container "bar" 17)
                "bar"))))

(run!)



