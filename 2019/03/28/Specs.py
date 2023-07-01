
def score(rolls):
    total = sum(rolls)
    nb_rolls = len(rolls)
    in_frame = False 

    for i in range(0, nb_rolls-1):
        if (not in_frame) and rolls[i] == 10:
            if (i < nb_rolls-1):
                total+=rolls[i+1]
            if (i < nb_rolls-2):
                total+=rolls[i+2]
        else:
            if (not in_frame):
                if (rolls[i] + rolls[i+1]) == 10:
                    total+=rolls[i+2]
            in_frame = not in_frame    

    return total

def test_score_no_roll_yields_zero():
    assert score([]) == 0

def test_score_one_roll_yields_that_score():
    assert score([4]) == 4
    assert score([7]) == 7

def test_score_two_rolls_yields_the_sum():
    assert score([3,5]) == 8

def roll_many(count,score):
    return [score]*count

def test_score_twenty_rolls_of_1_yield_20():

    assert score(roll_many(20,1)) == 20 

def test_score_with_spare_in_first_frame_collect_one_bonus():
    assert score([4,6,5]) == 4+6+5+5
    assert score([8,2,7]) == 8+2+7+7

def test_score_with_spare_collect_one_bonus():
    assert score([5,4,7,3,9]) == 5+4+7+3+9+9

def test_score_with_spares_collect_bonuses():
    assert score([5,5,7,3,9]) == 5+5+7*2+3+9*2

def test_score_with_0_and_10_counts_as_a_spare():
    assert score([0,10,4,3]) == 0 + 10 + 4*2 + 3

def test_score_with_strike_in_first_frame_collect_two_bonuses():
    assert score([10,3,4]) == 10 + 3*2 + 4*2
    assert score([10,4,2]) == 10 + 4*2 + 2*2

def test_score_with_two_distant_strikes_collect_bonuses():
    assert score([10,3,4,10,2,2]) == 10 + 3*2 + 4*2 + 10 + 2*2 + 2*2

def test_score_with_five_strikes_collect_bonuses():
    assert score(roll_many(5,10)) == 120


