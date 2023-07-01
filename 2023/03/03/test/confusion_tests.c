
#include "unity_fixture.h"
#include "unity.h"
#include "unity_memory.h"
#include "stdlib.h"
#include "confusion.h"
TEST_GROUP(confusion);


TEST_SETUP(confusion) {
}

TEST_TEAR_DOWN(confusion) {
}

TEST(confusion,trivial_cases){

    int operands[] = { 0, 0 };
    int n = solve_addition("11", 2, operands);
    TEST_ASSERT_EQUAL(2, n);
    TEST_ASSERT_EQUAL(1, operands[0]);
    TEST_ASSERT_EQUAL(1, operands[1]);


    operands[0] = 0;
    operands[1] = 0;

    n = solve_addition("22", 4, operands);
    TEST_ASSERT_EQUAL(2, operands[0]);
    TEST_ASSERT_EQUAL(2, operands[1]);
    TEST_ASSERT_EQUAL(2, n);

    operands[0] = 0;
    operands[1] = 0;

    n = solve_addition("20", 2, operands);
    TEST_ASSERT_EQUAL(2, operands[0]);
    TEST_ASSERT_EQUAL(0, operands[1]);
    TEST_ASSERT_EQUAL(2, n);
}

TEST(confusion, bigger_operands) {
    int operands [] = { 0, 0, 0 };
    int n = solve_addition("102", 12, operands);
    TEST_ASSERT_EQUAL(10, operands[0]);
    TEST_ASSERT_EQUAL(2, operands[1]);
    TEST_ASSERT_EQUAL(2, n);

    n = solve_addition("120", 21, operands);
    TEST_ASSERT_EQUAL(1, operands[0]);
    TEST_ASSERT_EQUAL(20, operands[1]);
    TEST_ASSERT_EQUAL(2, n);

    n = solve_addition("121", 22, operands);
    TEST_ASSERT_EQUAL(1, operands[0]);
    TEST_ASSERT_EQUAL(21, operands[1]);
    TEST_ASSERT_EQUAL(2, n);

    n = solve_addition("1234", 46, operands);
    TEST_ASSERT_EQUAL(12, operands[0]);
    TEST_ASSERT_EQUAL(34, operands[1]);
    TEST_ASSERT_EQUAL(2, n);

    n = solve_addition("11111111", 2222, operands);
    TEST_ASSERT_EQUAL(1111, operands[0]);
    TEST_ASSERT_EQUAL(1111, operands[1]);
    TEST_ASSERT_EQUAL(2, n);
}
TEST(confusion, more_operands) {
    int operands [] = { 0, 0, 0 };
    int n = solve_addition("111", 3, operands);
    TEST_ASSERT_EQUAL(1, operands[0]);
    TEST_ASSERT_EQUAL(1, operands[1]);
    TEST_ASSERT_EQUAL(1, operands[2]);
    TEST_ASSERT_EQUAL(3, n);

    n = solve_addition("123", 6, operands);
    TEST_ASSERT_EQUAL(1, operands[0]);
    TEST_ASSERT_EQUAL(2, operands[1]);
    TEST_ASSERT_EQUAL(3, operands[2]);
    TEST_ASSERT_EQUAL(3, n);
}


