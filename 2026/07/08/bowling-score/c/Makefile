CLEANUP = rm -f

C_COMPILER=gcc
ifeq ($(shell uname -s), Darwin)
C_COMPILER=clang
endif

UNITY_ROOT=unity

TEST_TARGET=bin/run_test

TEST_FILES=test/*.c test/runner/*.c

SRC_FILES=src/bowling.c $(UNITY_ROOT)/src/unity.c $(UNITY_ROOT)/extras/memory/src/unity_memory.c $(UNITY_ROOT)/extras/fixture/src/unity_fixture.c  $(TEST_FILES)

INC_DIRS=-Isrc -I$(UNITY_ROOT)/src -I$(UNITY_ROOT)/extras/fixture/src -I$(UNITY_ROOT)/extras/memory/src

unit:
	mkdir -p test/runner
	mkdir -p bin
	./gen_test_runner.awk test/bowling_tests.c >test/runner/test_runner.c
	./gen_all_tests.awk test/bowling_tests.c >test/runner/all_tests.c
	$(C_COMPILER) $(CFLAGS) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES) -o $(TEST_TARGET)
	- ./$(TEST_TARGET)

tests: bowling
	bin/bowling <testdata/input.txt >testdata/output.txt
	diff testdata/expected.txt testdata/output.txt

bowling: src/bowling.c src/main.c
	mkdir -p bin
	cc src/main.c src/bowling.c -o bin/bowling

clean:
	rm bin/*

format: src/bowling.c src/main.c test/bowling_tests.c
	clang-format -i src/bowling.c
	clang-format -i src/main.c
	clang-format -i test/bowling_tests.c
