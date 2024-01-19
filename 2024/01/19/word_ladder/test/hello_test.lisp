(require :asdf)

(load "./src/word-ladder.lisp")

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defparameter *dictionnary*
    (list
        "bee"
        "bog"
        "bug"
        "cat"
        "cog"
        "cot"
        "cut"
        "dag"
        "dam"
        "dig"
        "dog"
        "zoo"
    ))


(test adjacent-mot-identique-est-faux
    (is (equal nil (adjacent "dog" "dog"))))

(test adjacent-mot-different-par-une-lettre
    (is (equal t (adjacent "dog" "dug")))
    (is (equal nil (adjacent "zoo" "dug")))
    (is (equal t (adjacent "cat" "cot"))))


(test adjacent-liste-mot
    (is (equal
            (list "bog" "cog" "dag" "dig")
            (adjacents *dictionnary* "dog")))

    (is (equal
            (list "cot" "cut")
            (adjacents *dictionnary* "cat")))

    (is (equal
            nil
            (adjacents *dictionnary* "zoo"))))

(test target-in-adjacents
    ; j ai aucune idée de ce que vous faites, je me laisse guider
    ; ça fait 17min que j'ai pas lancé les tests
    ; votre expert métier et technique vous aide beaucoup
    (is (equal
        '(("bog" "dog") ("cog" "dog") ("dag" "dog") ("dig" "dog"))
        (chemins *dictionnary* "dog"))))

(test premier-test-de-recette
    (is (equal (list "dog" "cog" "cot" "cat") (ladder *dictionnary* "dog" "cat"))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
