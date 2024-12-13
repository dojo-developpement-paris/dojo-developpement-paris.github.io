#include "hello.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  char *name = argc >= 2 ? argv[1] : "";
  char *output = hello(name);
  if (output) {
    printf("%s\n", output);
    free(output);
  }
  return 0;
}
