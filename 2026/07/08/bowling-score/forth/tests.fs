\ tests.fs

require ffl/tst.fs
require bowling.fs

page
t{ ." no rolls result in score of zero" cr
     start-game
     final-score
     0 ?s
}t

t{ ." average rolls result in sum of rolls" cr
    start-game
    3 add-roll
    6 add-roll
    2 add-roll
    4 add-roll
    final-score 15 ?s
}t

t{ ." spare results in a bonus" cr
    start-game
    3 add-roll 7 add-roll 4 add-roll 6 add-roll 1 add-roll 0 add-roll
    final-score 26 ?s
}t

t{ ." bonus cancels once collected" cr
    start-game
    4 add-roll 6 add-roll 4 add-roll 1 add-roll
    final-score 19 ?s
}t

t{ ." strike results in two bonuses" cr
    start-game
    10 add-roll 3 add-roll 2 add-roll
    final-score 20 ?s
}t

t{ ." strikes bonuses can accumulate" cr
    start-game
    10 add-roll 10 add-roll 3 add-roll 2 add-roll
    final-score 43 ?s
}t

t{ ." strikes happen at a frame limit" cr
    start-game
    0 add-roll 10 add-roll 2 add-roll 3 add-roll
    final-score 17 ?s
}t

t{ ." after ten frames roll are not added" cr
    start-game
    12 0 [do] 10 add-roll [loop]
    final-score 300 ?s
}t
tst-get-result
cr
." tests:" swap . 
."  errors:" dup .
(bye)
