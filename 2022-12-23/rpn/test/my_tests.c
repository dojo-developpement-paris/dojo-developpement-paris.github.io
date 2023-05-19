#include "unity_fixture.h"
#include "unity.h"
#include "unity_memory.h"
#include "stdlib.h"
#include "my_code.h"
TEST_GROUP(my_code);


TEST_SETUP(my_code) {
    UnityMalloc_StartTest(); // see unity/extras/memory/readme.md
}

TEST_TEAR_DOWN(my_code) {
    UnityMalloc_EndTest();
}

TEST(my_code,given_a_number_yield_that_number){
    TEST_ASSERT_EQUAL_INT(42, rpn_calc("42"));
    TEST_ASSERT_EQUAL_INT(17, rpn_calc("17"));
}
TEST(my_code,given_a_number_within_spaces_yield_that_number){
    TEST_ASSERT_EQUAL_INT(23, rpn_calc("  23  "));
}
TEST(my_code,given_a_number_and_an_unary_operation_evaluate) {
    TEST_ASSERT_EQUAL_INT(-4807, rpn_calc("4807 ~"));
    TEST_ASSERT_EQUAL_INT(24, rpn_calc("4 !"));
}

TEST(my_code,given_several_number_yield_the_last_one) {
    TEST_ASSERT_EQUAL_INT(17, rpn_calc("23 19 17"));
}

TEST(my_code, given_numbers_and_binary_operator_evaluate) {
    TEST_ASSERT_EQUAL_INT(40, rpn_calc("23 17 +"));
    TEST_ASSERT_EQUAL_INT(53, rpn_calc("52 1 +"));
    TEST_ASSERT_EQUAL_INT(51, rpn_calc("52 1 -"));
}
