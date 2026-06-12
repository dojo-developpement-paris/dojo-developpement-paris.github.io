\ ffl/tst.fs
\ needed for Vim to syntax highligth Forth instead of F#

require ffl/tst.fs

variable score
variable last_roll
variable bonus

: start ( -- )
    score off
    bonus off
    last_roll off
;

: collect_bonus ( int -- int )
    dup bonus @ *
    score +!
    bonus off
;

: spare? ( int -- flag )
    last_roll @ + 10 =
;

: check_bonus ( int -- int )
    dup spare? if
        1 bonus !
    endif
;

: add_roll ( int -- )
    collect_bonus
    check_bonus
    dup last_roll !
    score +!
;

." 0 rolls then score is 0" cr
t{
    start
    score @
    0 ?s
}t

." 1 roll then score is roll" cr
t{
    start
    7 add_roll
    score @
    7 ?s
}t

." 2 rolls then score is sum" cr
t{
    start
    7 add_roll
    1 add_roll
    score @
    8 ?s
}t

." one spare, then third roll is bonus" cr
t{
    start
    7 add_roll
    3 add_roll
    2 add_roll
    score @
    14 ?s
}t

." one another spare, then third roll is bonus" cr
t{
    start
    6 add_roll
    4 add_roll
    2 add_roll
    score @
    14 ?s
}t

." bonus is clean after used" cr
t{
    start
    7 add_roll
    3 add_roll
    2 add_roll
    1 add_roll
    score @
    15 ?s
}t

tst-get-result

(bye)
