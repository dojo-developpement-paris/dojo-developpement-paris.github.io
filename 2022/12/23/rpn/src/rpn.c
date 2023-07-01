#include <stdio.h>
#include "my_code.h"

int main(int argc, char *argv[]) {
    if(argc < 2) {
        fprintf(stderr, "usage: rpn \"expression\" \n");
        return 1;
    }
    printf("%d\n", rpn_calc(argv[1]));
    return 0;
}
