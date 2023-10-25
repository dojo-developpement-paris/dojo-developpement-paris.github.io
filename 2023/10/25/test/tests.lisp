(ql:quickload "fiveam")
(in-package :fiveam)
(def-suite* word-ladder)

(load "./src/word-ladder.lisp")

(test strings-are-adjacent-if-different-by-1-letter
      (is (adjacentp "a" "b"))
      (is (not (adjacentp "a" "a")))
      (is (adjacentp "ab" "ac"))
      (is (not (adjacentp "bb" "ac")))
      (is (not (adjacentp "bog" "bog")))
      (is (adjacentp "bog" "cog"))
      (is (not (adjacentp "dog" "cat")))
      )

(run!)
