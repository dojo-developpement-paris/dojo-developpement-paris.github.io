// bowling.c
#include "bowling.h"
#include <stdio.h>

int score(int *rolls, int nb_rolls) {
    int score = 0;
    int bonus = 0;
    int next_bonus = 0;
    int last_roll = 0;
    int half_frame = 0;
    for (int index = 0; index < nb_rolls; index++) {
        int roll = rolls[index];
        score += roll * bonus;
        bonus = next_bonus;
        next_bonus = 0;
        if (half_frame < 20) {
            if (half_frame % 2 == 0) {
                if (roll == 10) {
                    bonus++;
                    next_bonus++;
                    half_frame++;
                } else {
                    last_roll = roll;
                }
            }
            else {
                if (last_roll + roll == 10) {
                    bonus = 1;
                }
            }
            score += roll;
            half_frame++;
        }
    }
    return score;
}
