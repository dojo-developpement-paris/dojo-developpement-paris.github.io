def well_placed(secret, guess, index):
    return secret[index] == guess[index]


def count_well_placed(secret, guess):
    result = 0
    for i in range(len(secret)):
        if well_placed(secret, guess, i):
            result += 1
    return result


def evaluate(secret, guess):
    if len(guess) == 1 and well_placed(secret, guess, 0):
        return [1, 0]
    if len(guess) == 2:
        if well_placed(secret, guess, 0) and well_placed(secret, guess, 1):
            return [count_well_placed(secret, guess), 0]

        if well_placed(secret, guess, 0) and not well_placed(secret, guess, 1):
            return [count_well_placed(secret, guess), 0]
        if not well_placed(secret, guess, 0) and well_placed(secret, guess, 1):
            return [count_well_placed(secret, guess), 0]

        if secret[0] == guess[1] and secret[1] != guess[0]:
            return [0, 1]
        if secret[0] != guess[1] and secret[1] == guess[0]:
            return [0, 1]

        if secret[0] == guess[1] and secret[1] == guess[0]:
            return [0, 2]
    return [0, 0]


def test_no_match_one_color():
    assert evaluate(["blue"], ["red"]) == [0, 0]


def test_match():
    assert evaluate(["blue"], ["blue"]) == [1, 0]


def test_match_2_colors():
    assert evaluate(["blue", "green"], ["blue", "green"]) == [2, 0]


def test_match_2_colors_inverted():
    assert evaluate(["green", "blue"], ["green", "blue"]) == [2, 0]


def test_bad_position():
    assert evaluate(["green", "blue"], ["blue", "green"]) == [0, 2]


def test_bad_position_others_colors():
    assert evaluate(["green", "red"], ["red", "green"]) == [0, 2]


def test_only_one_well_placed():
    assert evaluate(["green", "red"], ["green", "blue"]) == [1, 0]

    assert evaluate(["green", "yellow"], ["green", "blue"]) == [1, 0]

    assert evaluate(["green", "yellow"], ["red", "yellow"]) == [1, 0]


def test_only_one_misplaced():
    assert evaluate(["green", "red"], ["yellow", "green"]) == [0, 1]

    assert evaluate(["red", "green"], ["green", "yellow"]) == [0, 1]
