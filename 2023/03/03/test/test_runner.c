#include "unity_fixture.h"

TEST_GROUP_RUNNER(confusion) {
    RUN_TEST_CASE(confusion, trivial_cases);
    RUN_TEST_CASE(confusion, bigger_operands);
    RUN_TEST_CASE(confusion, more_operands);
}
