#include "hello.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HELLO "Hello "
#define HELLO_LENGTH sizeof(HELLO)
#define DEFAULT_NAME "world"
#define DEFAULT_NAME_LENGTH sizeof(DEFAULT_NAME)

char *hello(char *name) {
  char *suffix = strlen(name) > 0 ? name : DEFAULT_NAME;
  char *message = (char *)malloc(HELLO_LENGTH + strlen(suffix));

  if (message == NULL) {
    printf("out of memory (malloc)");
    exit(1);
  }

  strcpy(message, HELLO);
  strcat(message, suffix);
  return message;
}
