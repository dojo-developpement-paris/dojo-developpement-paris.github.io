#include "hello.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
  char *name = argc >= 2 ? argv[1] : "";
  printf("%s\n", hello(name));
  return 0;
}
