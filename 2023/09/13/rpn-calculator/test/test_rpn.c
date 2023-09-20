#include "rpn.h"
#include "unity.h"

void setUp(void) {}

void tearDown(void) {}

void test_rpn(void) {
  TEST_ASSERT_EQUAL_INT(0, rpn(""));
  TEST_ASSERT_EQUAL_INT(4, rpn("4"));
  TEST_ASSERT_EQUAL_INT(7, rpn("7"));
  TEST_ASSERT_EQUAL_INT(42, rpn("42"));
  TEST_ASSERT_EQUAL_INT(27, rpn("27"));
  TEST_ASSERT_EQUAL_INT(666, rpn("666"));
  TEST_ASSERT_EQUAL_INT(1234, rpn("1234"));
  TEST_ASSERT_EQUAL_INT(2, rpn("1 2"));
  TEST_ASSERT_EQUAL_INT(3, rpn("1 2+"));
  TEST_ASSERT_EQUAL_INT(488, rpn("1 487+"));
  TEST_ASSERT_EQUAL_INT(59, rpn("42 17+"));
  TEST_ASSERT_EQUAL_INT(40, rpn("42 17 23+"));
  TEST_ASSERT_EQUAL_INT(82, rpn("42 17 23++"));
}

int main(void) {
  UNITY_BEGIN();
  RUN_TEST(test_rpn);
  return UNITY_END();
}

// rpn 4 => 4
// rpn 7 => 7
// rpn 42 => 42
// rpn 27 => 27
// rpn 666 => 666
// rpn 1234 => 1234
// rpn 1 2 => 2
// rpn 1 2+  => 3
// rpn 1 487+  => 488
// rpn 42 17+  => 59
// rpn 42 17 23+  => 40
// rpn 42 17 23++  => 82
