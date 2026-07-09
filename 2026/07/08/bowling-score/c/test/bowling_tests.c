// bowling_tests.c
#include "bowling.h"
#include "unity.h"
#include "unity_fixture.h"
#include "unity_memory.h"

TEST_GROUP(bowling);

TEST_SETUP(bowling) {}

TEST_TEAR_DOWN(bowling) {}

TEST(bowling, given_average_rolls_then_score_is_sum_of_rolls) {
    int rolls[] = {2, 3, 1, 7};
    int nb_rolls = 4;
    TEST_ASSERT_EQUAL(13, score(rolls, nb_rolls));
}

TEST(bowling, given_a_spare_then_the_next_roll_is_counted_twice) {
    int rolls[] = {4, 6, 3, 2};
    int nb_rolls = 4;
    TEST_ASSERT_EQUAL(18, score(rolls, nb_rolls));
}

TEST(bowling, a_spare_can_be_counted_only_inside_a_frame) {
    int rolls[] = {6, 4, 6, 2};
    int nb_rolls = 4;
    TEST_ASSERT_EQUAL(24, score(rolls, nb_rolls));
}

TEST(bowling, given_a_strike_then_the_next_two_rolls_are_counted_twice) {
    int rolls[] = {10, 2, 5};
    int nb_rolls = 3;
    TEST_ASSERT_EQUAL(24, score(rolls, nb_rolls));
}

TEST(bowling, after_ten_frames_rolls_are_not_added_except_bonus) {
    int rolls[] = {10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10}; 
    int nb_rolls = 12;
    TEST_ASSERT_EQUAL(300, score(rolls, nb_rolls));
}

