(require :asdf)

(load "./test/dictionnaire.lisp")

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun compose (crepe galette)
      (concatenate 'string (convertir crepe) " " (convertir galette)))

(defun convertir (nombre)
      (cond
            ((equal 0 nombre)
                  "zero")
            ((equal 0 (mod nombre 1000))
                  (compose (floor nombre 1000) 1000))
            ((> nombre 2000)
                  (compose (floor nombre 1000) 1001))
            ((equal nombre 2000)
                  (compose 2 1000))
            ((>= nombre (length *dictionnaire*))
                  (compose 1000 (- nombre 1000)))
            (T
                  (elt *dictionnaire* nombre))))

(test nombres-simples
      (is (equal (convertir 0) "zéro"))
      (is (equal (convertir 1) "un"))
      (is (equal (convertir 2) "deux"))
      (is (equal (convertir 3) "trois"))
      (is (equal (convertir 1000) "mille"))
      )

(test nombres-composés
      (is (equal (convertir 1001) "mille un"))
      (is (equal (convertir 1002) "mille deux"))
      (is (equal (convertir 1245) "mille deux cent quarante-cinq"))
      (is (equal (convertir 2000) "deux mille"))
      (is (equal (convertir 2001) "deux mille un"))
      (is (equal (convertir 3000) "trois mille"))
      )

; dictionnaire
; jusqu'à 16
; négatif
; nombre rationel
; PI
; 2

(if (run-all-tests)
      (sb-ext:quit)
      (sb-ext:exit :abort 0))
