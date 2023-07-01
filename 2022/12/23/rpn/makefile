CLEANUP = rm -f

C_COMPILER=gcc
ifeq ($(shell uname -s), Darwin)
C_COMPILER=clang
endif

UNITY_ROOT=unity

TEST_TARGET=test.out
MAIN_TARGET=a.out

SRC_FILES=$(UNITY_ROOT)/src/unity.c $(UNITY_ROOT)/extras/memory/src/unity_memory.c $(UNITY_ROOT)/extras/fixture/src/unity_fixture.c  test/my_tests.c test/test_runner.c test/all_tests.c src/my_code.c

INC_DIRS=-Isrc -I$(UNITY_ROOT)/src -I$(UNITY_ROOT)/extras/fixture/src -I$(UNITY_ROOT)/extras/memory/src

all: clean default

main: src/my_code.c src/rpn.c
	$(C_COMPILER) $(CFLAGS) $(INC_DIRS) $(SYMBOLS) src/my_code.c src/rpn.c -o $(MAIN_TARGET)

default: $(SRC_FILES)
	$(C_COMPILER) $(CFLAGS) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES) -o $(TEST_TARGET)
	- ./$(TEST_TARGET)

clean:
	$(CLEANUP) $(TEST_TARGET) $(MAIN_TARGET)



