#include "rpn.h"
#include <ctype.h>
#include <string.h>

#define ZERO '0'
#define EOS '\0'

int digitToInt(char c) { return c - ZERO; }

int rpn(char *expression) {
  int result = 0;
  int pred = 0;

  for (int i = 0; expression[i] != EOS; i++) {
    char current_char = expression[i];

    if (current_char == '+') {
      return pred + result;
    }

    if (!isdigit(current_char)) {
      pred = result;
      result = 0;
    } else {
      result = result * 10 + digitToInt(current_char);
    }
  }

  return result;
}
