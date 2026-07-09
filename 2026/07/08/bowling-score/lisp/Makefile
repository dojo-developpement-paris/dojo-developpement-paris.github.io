unit: tests.lisp bowling.lisp
	sbcl --noinform --load tests.lisp

tests: bowling.lisp 
	sbcl --noinform --load main.lisp <testdata/input.txt >testdata/output.txt
	diff testdata/expected.txt testdata/output.txt

main: bowling.lisp main.lisp
	sbcl --noinform --load main.lisp
