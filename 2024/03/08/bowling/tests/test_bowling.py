def compute_score(rolls):
    if len(rolls) == 0:
        return 0

    return frame_score(rolls) + compute_score(rolls[2:])


def frame_score(rolls):
    if len(rolls) == 1:
        return rolls[0]

    frame_total = rolls[0] + rolls[1]
    if frame_total == 10 and len(rolls) > 2:
        spare_bonus = rolls[2]
        return frame_total + spare_bonus

    return frame_total


def test_should_return_0_when_no_pins_down_first_frame():
    first_roll_pins_down = 0
    second_roll_pins_down = 0
    assert compute_score([first_roll_pins_down, second_roll_pins_down]) == 0


def test_should_return_sum_of_pins_when_some_pins_down_first_frame():
    assert compute_score([5, 3]) == 8
    assert compute_score([5, 5]) == 10
    assert compute_score([2, 7]) == 9


def test_should_return_sum_of_pins_for_several_frames():
    assert compute_score([5, 3, 4, 0]) == 12


def test_should_return_sum_of_pins_on_half_frame():
    assert compute_score([5]) == 5


def test_spare():
    assert compute_score([5, 5, 3]) == 16
