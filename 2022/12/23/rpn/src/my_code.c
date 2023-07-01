#include <stdlib.h>
#include "my_code.h"
#include <string.h>
#include <stdbool.h>


int factorial(int n) {
    int result = 1;
    for(int i=2; i<=n; i++)
        result *= i;
    return result;
}

void push(STACK *stack, int value) {
    stack->values[stack->level++] = value;
}

int pop(STACK *stack) {
    return stack->values[--stack->level];
}

bool equals(char *a, char *b) {
    if(a==NULL)
        return false;
    return (strcmp(a,b)==0);
}
const int MAX_STACK = 256;

int rpn_calc(char *expression){
    STACK *stack = (STACK *)malloc(sizeof(STACK));
    char *buffer = strdup(expression);
    char *token;
    token = strtok(buffer, " ");

    while(token != NULL) { 
        switch(token[0]) {
            case '~':
                push(stack, -pop(stack));
                break;
            case '!':
                push(stack, factorial(pop(stack)));
                break;
            case '+':
                push(stack, pop(stack)+pop(stack));
                break;
            case '-': {
                          int top = pop(stack);
                          push(stack,pop(stack)-top);
                          break; 
                      }
            default:
                      push(stack, atoi(token));
        }
        token = strtok(NULL, " ");
    }
    free(buffer);
    int result = pop(stack);
    free(stack);
    return result;
}
