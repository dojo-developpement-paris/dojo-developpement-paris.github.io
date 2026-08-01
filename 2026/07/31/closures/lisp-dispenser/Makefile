unit: tests.lisp dispenser.lisp
	sbcl --noinform --load tests.lisp

tests: dispenser.lisp 
	sbcl --noinform --load main.lisp <testdata/input.txt >testdata/output.txt
	diff testdata/expected.txt testdata/output.txt

main: dispenser.lisp main.lisp
	sbcl --noinform --load main.lisp
