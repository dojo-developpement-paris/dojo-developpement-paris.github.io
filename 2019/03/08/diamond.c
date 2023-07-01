#include <stdio.h>

int main(int argc, char *argv[]) {
    char max_letter = argv[1][0];
    int half = max_letter - 'A';
    int size = half * 2 + 1;
    for(int row=0; row<size; row++) {
        for(int col=0; col<size; col++) {
            if (row <= half) {
                char letter = 'A'+row;
                int rel_col = col-half+row;
                if (rel_col== 0 || rel_col == row*2)
                    putchar(letter);
                else
                    putchar(' ');          
            } 
            else {
                char letter = 'A'-row+size-1;
                if (col==row-half || col-half == half+half-row)
                    putchar(letter);
                else
                    putchar(' ');          
            }
        }
        putchar('\n');
    }
    return 0;
}
