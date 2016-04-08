\ Rent.fs

CREATE PLAN 100 CELLS ALLOT 
VARIABLE PROFIT

: INITIALIZE
    0 PROFIT !
    PLAN 100 CELLS ERASE ;

: PLAN# ( i -- addr )
    CELLS PLAN + ; 

: PLAN@ ( i -- n )
    PLAN# @  PROFIT @ MAX ;

: PLAN! ( n i -- )
    PLAN# DUP @ 
    ROT MAX 
    SWAP ! ;

: RENT ( end price -- )
    PROFIT @ + SWAP PLAN! ;

: CASH ( end -- )
    PLAN@ PROFIT ! ;
    
