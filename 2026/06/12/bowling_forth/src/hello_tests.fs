\ ffl/tst.fs
\ needed for Vim to syntax highligth Forth instead of F#

require ffl/tst.fs

: start ( -- )
    
;

: score ( -- int )
    0
;

." 0 rolls then score is 0" cr
t{
    start
    score
    0 ?s
}t

tst-get-result

(bye)
