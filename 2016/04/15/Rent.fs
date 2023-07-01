\ Rent.fs

REQUIRE ffl/act.fs

VARIABLE PROFIT
ACT-CREATE PLAN
ACT-CREATE ACTIONS

: INITIALIZE 
    0 PROFIT ! ;

: PLAN@ ( # -- n )
    PLAN ACT-GET 0= IF 0 THEN ;

: PLAN! ( n # -- )
    PLAN ACT-INSERT ;     
    
: RENT-AIRPLANE ( t d p -- )
    PROFIT @ + -ROT + DUP   PLAN@  ( profit+p, t+d, plan[t+d] )  
    ROT MAX SWAP PLAN! ;

: UPDATE-PROFIT ( time -- )
    PLAN@ PROFIT @ MAX PROFIT ! ;

: <FIELD ( v cell #bits -- cell' )
    LSHIFT OR ;

21 CONSTANT LONG
17 CONSTANT SHORT
: ACTION>KEY ( t d p -- k )
    SWAP ROT    
    LONG <FIELD 
    SHORT <FIELD ; 

: MASK ( #bits -- mask )
    1 SWAP LSHIFT 1- ; 

: FIELD> ( cell #bits -- n cell' )
    2DUP MASK AND -ROT RSHIFT ;   
    
: KEY>ACTION ( k -- t d p )
    SHORT FIELD>
    LONG  FIELD> 
    SWAP ROT ;

: EXECUTE-ACTION ( t d p -- ) 
    ?DUP 0= IF DROP UPDATE-PROFIT ELSE RENT-AIRPLANE THEN ;

: INSERT-KEY ( k -- )
  0 SWAP ACTIONS ACT-INSERT ;

: ADD-ORDER ( t d p -- )
    -ROT 2DUP ( p t d t d )
    + 0 0     ( p t d t+d 0 0 )
    ACTION>KEY ( p t d k )
    INSERT-KEY ( p t d )
    ROT        ( t d p )
    ACTION>KEY
    INSERT-KEY ;

: DECODE-AND-EXECUTE ( d k -- )
    NIP KEY>ACTION EXECUTE-ACTION ;

' DECODE-AND-EXECUTE CONSTANT DO-IT

: COMPUTE-PROFIT
    DO-IT ACTIONS ACT-EXECUTE ;
     
    

    
    
