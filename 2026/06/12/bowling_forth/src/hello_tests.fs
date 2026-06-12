\ ffl/tst.fs
\ needed for Vim to syntax highligth Forth instead of F#

require ffl/tst.fs

variable score

: start ( -- )
    score off
;

: add_roll ( int -- )
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

tst-get-result

(bye)
