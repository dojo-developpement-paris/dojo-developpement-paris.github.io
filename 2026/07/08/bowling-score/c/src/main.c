#include "bowling.h"
#include <stdio.h>
#include <stdlib.h>

#define MAX_LINE 256
#define MAX_ROLLS 21

int get_rolls(int *rolls) {
  char line[MAX_LINE] = "";
  char *s;
  char *e;
  long int n;
  int nb_rolls;

  fgets(line, MAX_LINE, stdin);

  s = line;
  for (nb_rolls = 0; nb_rolls < MAX_ROLLS; nb_rolls++) {
    n = strtol(s, &e, 10);
    if (e == s)
      break;

    rolls[nb_rolls] = n;
    s = e;
  }
  return nb_rolls;
}

int main() {
  int rolls[MAX_ROLLS];
  int nb_rolls;
  while ((nb_rolls = get_rolls(rolls))) {
    printf("%d\n", score(rolls, nb_rolls));
  }
  return 0;
}
