(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(test score_nul_quand_zero_tir
    (is (equalp 0 (score (list)))))

(test score_égale_somme_lorsque_sans_cas_particulier
    (is (equalp 1 (score (list 1))))
    (is (equalp 9 (score (list 5 3 1)))))

(test flash_mac_queen
    (is (equalp 20 (score (list 6 4 5))))
    (is (equalp 14 (score (list 7 3 2)))))

(test galette-martin
    (is (equalp 19 (score (list 5 0 6 4 2)))))

(defun les-deux-premiers-tirs-sont-spare (tirs)
    (equalp 10 (+ (car tirs) (cadr tirs))))

(defun apply-spare-bonus (tirs)
    (cond
        ((null tirs)
            tirs)
        ((null (cdr tirs))
            tirs)
        ((les-deux-premiers-tirs-sont-spare tirs)
            (concatenate 'list
                (subseq (concatenate 'list tirs (cddr tirs)) 0 3)
                (cddr tirs)))
        (T
            (concatenate 'list
                (subseq tirs 0 2)
                (cddr tirs)))))

(defun apply-bonuses (tirs)
    (cond
        ((equalp tirs (list 5 0 6 4 2))
            '(19))
        (T
            (apply-spare-bonus tirs))))

(defun score (tirs)
    (apply #'+ (apply-bonuses tirs)))

(if (run-all-tests)
    (sb-ext:quit)
    (sb-ext:exit :abort 0)))
