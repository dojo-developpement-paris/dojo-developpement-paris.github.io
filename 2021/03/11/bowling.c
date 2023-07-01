#include <stdio.h>
#include <stdlib.h>
#include "game.h"

int main() {
    int cases = 0;
    scanf("%d\n",&cases);

    for(int c = 0; c < cases; c++) {
        int max_throws = 0;
        scanf("%d\n", &max_throws);

        struct game *g = new_game();
        for(int t = 0; t < max_throws; t++) {
            int throw;
            scanf("%d\n", &throw);
            g = add_throw(g, throw);
        }
        printf("%d\n", score(g));
        destroy_game(g);
    }
    exit(0);
}
