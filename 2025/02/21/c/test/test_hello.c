#include "hello.h"
#include "unity.h"
#include <stdlib.h>

void setUp(void) {}

void tearDown(void) {}

void test_hello_world(void) {
  char *output = hello("");
  TEST_ASSERT_EQUAL_STRING("Hello world", output);
  free(output);
}

void test_hello_foo(void) {
  char *output = hello("foo");
  TEST_ASSERT_EQUAL_STRING("Hello foo", output);
  free(output);
}

int main(void) {
  UNITY_BEGIN();
  RUN_TEST(test_hello_world);
  RUN_TEST(test_hello_foo);
  return UNITY_END();
}
