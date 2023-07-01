#include <stdio.h>
#include <stdlib.h>

#define MAX_THROWS 25

int throws[MAX_THROWS];

void print_score(int score) {
    printf("%d\n", score);
}

int get_int() {
    int value;
    scanf("%d", &value);
    return value;
}

void init_throws() {
    for(int i=0; i < MAX_THROWS; i++)
        throws[i] = 0;
}
int get_throws(int *throws) {
    init_throws();
    int max_throws = get_int();
    for(int i = 0; i < max_throws; i++) {
        int throw = get_int();
        throws[i] = throw;
    }
    return max_throws;
}
#define FRAME_LIMIT (half_frame % 2 == 0)

int score(int *throws, int max_throws) {
    int score = 0;
    int half_frame = 0;
    for(int i = 0; i < max_throws; i++) {
        if(half_frame < 20)
            score += throws[i];
        if (FRAME_LIMIT && throws[i] == 10)
        {
            score += throws[i+1] + throws[i+2];
            half_frame++;
        } else if (FRAME_LIMIT && throws[i] + throws[i+1] == 10)
            score += throws[i+2];
        half_frame++;
    }
    return score;
}

int main() {
    int series = get_int();
    for(int i = 0; i < series; i++) {
        int max_throws = get_throws(throws);
        print_score(score(throws, max_throws));
    }
    exit(0);
}
