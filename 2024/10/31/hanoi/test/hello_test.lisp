(require :asdf)

(asdf:load-system :fiveam)
(use-package :fiveam)
(asdf:load-system :fiveam-matchers)
(use-package :fiveam-matchers)

(defun top (truc)
	(car truc))

(defun remove-top (truc)
	(cdr truc))

(defun move (start end universe)
	(let* (
			(start-index (- start 1))
			(start-column (nth start-index universe))
			(disc (top start-column))
			(first-column (nth 0 universe))
			(second-column (nth 1 universe))
			(third-column (nth 2 universe))
			(direction (list start end))
		)
		(cond
			((equal direction '(2 1))
				(list (cons disc first-column) (remove-top start-column) third-column))
			((equal direction '(3 1))
				(list (cons disc first-column) second-column (remove-top start-column)))
			((equal direction '(1 2))
				(list (remove-top start-column) (cons disc second-column) third-column))
			((equal direction '(3 2))
				(list first-column (cons disc second-column) (remove-top start-column)))
			((equal direction '(1 3))
				(list (remove-top start-column) second-column (cons disc third-column)))
			((equal direction '(2 3))
				(list first-column (remove-top start-column) (cons disc third-column)))
		)
	)
)

(test moving_disc_to_right
	(let ((initial '((1 2 3) () ())))
		(is (equal '((2 3) () (1)) (move 1 3 initial)))
	)
)

(test moving_disc_to_middle
	(let ((initial '((1 2 3) () ())))
		(is (equal '((2 3) (1) ()) (move 1 2 initial)))
	)
	(let ((initial '((2 3) () (1))))
		(is (equal '((3) (2) (1)) (move 1 2 initial)))
	)
)

(test moving_disc_to_left
	(let ((initial '((2 3) () (1))))
		(is (equal '((1 2 3) () ()) (move 3 1 initial)))
	)
)

(test receiving-column-is-not-empty
	(let ((initial '((1) (2 3) ())))
		(is (equal '(() (1 2 3) ()) (move 1 2 initial)))
	)
	(let ((initial '((1) () (2 3))))
		(is (equal '(() () (1 2 3)) (move 1 3 initial)))
	)
)

(test starting-from-other-than-one
	(let ((initial '(() (1) (2 3))))
		(is (equal '(() () (1 2 3)) (move 2 3 initial)))
	)
	(let ((initial '(() (2 3) (1))))
		(is (equal '(() (1 2 3) ()) (move 3 2 initial)))
	)
	(let ((initial '((2 3) (1) ())))
		(is (equal '((1 2 3) () ()) (move 2 1 initial)))
	)
)

(if (run-all-tests)
	(sb-ext:quit)
	(sb-ext:exit :abort 0))
