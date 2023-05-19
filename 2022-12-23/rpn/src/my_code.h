int rpn_calc(char *);

typedef struct {
    int values[256];
    int level;
} STACK;

void push(STACK *, int);
int pop(STACK *);


