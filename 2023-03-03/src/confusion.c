#include <stdlib.h>
#include "confusion.h"

int solve_addition(char *expression, int target, int *operands) {
    int merged = atoi(expression);
    int divider = 1;
    while(operands[1] <= target && (operands[0] + operands[1] != target)) {
        divider *= 10;
        operands[0] = merged / divider;
        operands[1] = merged % divider;
    }
    if (operands[1] > target) {
        divider = 1;
        while(operands[1] <= target && (operands[0] + operands[1] + operands[2] != target)) {
            divider *= 10;
            operands[0] = merged / (divider * 10);
            operands[1] = merged / (divider * 10) % 10;
            operands[2] = merged % divider;
        }
        return 3;
    }
    return 2;
}


