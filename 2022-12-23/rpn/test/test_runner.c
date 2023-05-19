#include "unity_fixture.h"

TEST_GROUP_RUNNER(my_code) {
    RUN_TEST_CASE(my_code, given_a_number_yield_that_number);
    RUN_TEST_CASE(my_code, given_a_number_within_spaces_yield_that_number);
    RUN_TEST_CASE(my_code, given_a_number_and_an_unary_operation_evaluate);
    RUN_TEST_CASE(my_code, given_several_number_yield_the_last_one);
    RUN_TEST_CASE(my_code, given_numbers_and_binary_operator_evaluate);
}
