#include "unity_fixture.h"

TEST_GROUP_RUNNER(bowling) {
    RUN_TEST_CASE(bowling, given_average_rolls_then_score_is_sum_of_rolls);
    RUN_TEST_CASE(bowling, given_a_spare_then_the_next_roll_is_counted_twice);
    RUN_TEST_CASE(bowling, a_spare_can_be_counted_only_inside_a_frame);
    RUN_TEST_CASE(bowling, given_a_strike_then_the_next_two_rolls_are_counted_twice);
    RUN_TEST_CASE(bowling, after_ten_frames_rolls_are_not_added_except_bonus);
}
