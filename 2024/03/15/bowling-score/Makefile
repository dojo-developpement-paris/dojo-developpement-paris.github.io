unit: tests.lisp bowling.lisp
	sbcl --script tests.lisp

accept: bowling.lisp test-cases.txt expected.txt score.lisp
	sbcl --script score.lisp <test-cases.txt >results.txt
	diff expected.txt results.txt
