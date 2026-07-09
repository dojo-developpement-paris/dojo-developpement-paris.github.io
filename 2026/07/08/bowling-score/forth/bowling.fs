
: start-game ( -- frame, bonus, score )
    0 0 0 ;

\ duplicate the 3rd item under top of the stack
: dup3 ( a, b, c, d -- a, b, c, d, a )
    2>r over 2r> rot ;

\ rotate the 3rd item from under the top to the top
: rot3 ( a, b, c, d -- b, c, d, a )
    >r rot r> swap ;

\ rotate the top to 3rd position under the top
: -rot3 ( a, b, c, d -- d, a, b, c )
    swap >r -rot r> ;

\ isolate the current bonus part
: factor ( bonus -- factor )
    3 and ;

\ shift bonus to the next bonus
: next-bonus ( bonus -- bonus' )
    2/ 2/ ;

\ multiplies the roll by current bonus, adds it to the score and shifts the bonus
: collect-bonus ( bonus, score, roll -- bonus', score', roll )
    dup rot3           \ score, roll, roll, bonus
    dup factor         \ score, roll, roll, bonus, factor
    rot *              \ score, roll, bonus, extra
    rot3 + -rot        \ score', roll, bonus
    next-bonus -rot ;  \ bonus', score', roll

\ frame low nibble value = new-frame: 0, open frame: last roll + 1


: new-frame? ( frame, bonus, score, roll  -- frame, bousn, score, roll, f )
    dup3 15 and 0= ;

\ makes the frame open by recording the last roll
: open-frame ( frame, bonus, score, roll -- frame', bonus, score, roll )
    rot3 240 and over 1+ or -rot3 ;

\ if open frame, last roll = frame low nibble - 1
: last-roll ( frame -- roll )
    15 and 1- ;

\ add bonus for the next roll
: spare-bonus ( bonus -- bonus' )
    1+ ;

\ add bonus for the next and next next roll
: strike-bonus ( bonus -- bonus' )
    1+ 4 or ;

\ check and record a spare bonus
: check-spare ( frame, bonus, score, roll -- frame, bonus', score, roll )
    dup3 last-roll over + 10 = if
        rot spare-bonus -rot
    then ;

\ check and record a strike bonus
: check-strike? ( frame, bonus, score, roll -- frame, bonus', score, roll, f )
    dup 10 = if
        rot strike-bonus -rot true
    else 
        false
    then ;

\ advance the frame by 1 on the high value nibble, and make a new frame
: next-frame ( frame -- frame' )
    16 + 240 and ;

\ update frame information for a new frame
: close-frame ( frame, bonus, score, roll -- frame', bonus, score, roll )
    >r rot next-frame -rot r> ;

\ extract and check frame number
: (ten-frames?) ( frame -- f )
    4 rshift 10 >= ;

\ are we past ten frames?
: ten-frames? ( frame, bonus, score, roll -- frame, bouns, score, roll, f )
    dup3 (ten-frames?) ;

: add-roll ( frame, bonus, score, roll -- frame', bonus', score' )
    collect-bonus
    ten-frames? if drop else
        new-frame? if
            check-strike? if
                close-frame
            else
                open-frame
            then
        else
            check-spare
            close-frame
        then
        +
    then ;

\ get rid of unnecessary info on stack
: final-score ( frame, bonus, score -- score )
    -rot 2drop ;
