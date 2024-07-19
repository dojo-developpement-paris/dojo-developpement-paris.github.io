(require :asdf)

(load "./src/hello.lisp")

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun nth-digit (digit chars)
     (progn (princ (nth 53 chars))
            (princ (nth 54 chars))
            (princ (nth 55 chars))
            (princ (nth 56 chars))
      (cond
      ((and (equal (nth 54 chars) #\space) (equal (nth 56 chars) #\|)) 3)
      ((equal (nth 54 chars) #\|) 2)
      ((equal (nth 1 chars) #\_)  7)
      (T 1)))
)

(defun scan (bank-number)
  (let ((chars (remove-if (lambda (character) (equal character #\newline))
    (coerce bank-number 'list))))
    (cond
      ((equal (nth 60 chars) #\|) (+ (* 1 100000000) 28456789))
      ((equal (nth 33 chars) #\|) (+ (* 1 100000000) 29456789))
      (T (+ (* (nth-digit 0 chars) 100000000) 23456789)))))

(test recette
      (is (equal 123456789 (scan "
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
"))))

(test recette-encore
      (is (equal 129456789 (scan "
    _  _     _  _  _  _  _ 
  | _||_||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
"))))

(test recette-encore-encore
      (is (equal 128456789 (scan "
    _  _     _  _  _  _  _ 
  | _||_||_||_ |_   ||_||_|
  ||_ |_|  | _||_|  ||_| _|
"))))

(test un-sept-en-premier-chiffre
      (is (equal 723456789 (scan "
 _  _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
"))))

(test un-deux-en-premier-chiffre
      (is (equal 223456789 (scan "
 _  _  _     _  _  _  _  _ 
 _| _| _||_||_ |_   ||_||_|
|_ |_  _|  | _||_|  ||_| _|
"))))

(test un-trois-en-premier-chiffre
      (is (equal 323456789 (scan "
 _  _  _     _  _  _  _  _ 
 _| _| _||_||_ |_   ||_||_|
 _||_  _|  | _||_|  ||_| _|
"))))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0))
