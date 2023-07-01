
approve_debug:
	LAGS_ORDER_FILE=~/Coding/dojo-developpement-paris.github.io/2023-01-13/data/sample.csv python3 src/rent.py -r >../data/ref_debug_sample.txt

test_debug: src/*.py
	LAGS_ORDER_FILE=~/Coding/dojo-developpement-paris.github.io/2023-01-13/data/sample.csv python3 src/rent.py -r >../data/result_debug_sample.txt
	diff -u ../data/result_debug_sample.txt ../data/ref_debug_sample.txt

approve:
	LAGS_ORDER_FILE=~/Coding/dojo-developpement-paris.github.io/2023-01-13/data/sample.csv python3 src/rent.py -r >../data/ref_sample.txt

test: src/*.py
	LAGS_ORDER_FILE=~/Coding/dojo-developpement-paris.github.io/2023-01-13/data/sample.csv python3 src/rent.py -r >../data/result_sample.txt
	diff -u ../data/result_sample.txt ../data/ref_sample.txt
