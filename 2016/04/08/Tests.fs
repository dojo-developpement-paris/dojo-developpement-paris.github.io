\ Tests.fs
REQUIRE ffl/tst.fs

\ t' > t => P[t'] >= P[t]
\ \/ t t'  O(t,t',p) => P[t'] >= P[t]+p

REQUIRE Rent.fs

: TEST-PLAN
    INITIALIZE
    4807 15 PLAN!
    T{ 15 PLAN@ 4807 ?S }T ;

: TEST-UPDATE-ONLY-WITH-MAX
    INITIALIZE
    10 0 PLAN! 
    T{ 0 PLAN@ 10 ?S }T
    12 0 PLAN!
    T{ 0 PLAN@ 12 ?S }T
     8 0 PLAN!
    T{ 0 PLAN@ 12 ?S }T ;
      
: TEST-PLAN-IS-GE-PROFIT
    INITIALIZE
    T{ 0 PLAN@ 0 ?S }T 
    7 PROFIT !
    T{ 0 PLAN@ 7 ?S }T
    42 0 PLAN!
    T{ 0 PLAN@ 42 ?S }T ;

: TEST-RENT-THEN-CASH
    INITIALIZE
    5 10 RENT 
    T{ 5 PLAN@ 10 ?S }T 
    5 9  RENT
    T{ 5 PLAN@ 10 ?S }T
    3 PROFIT !
    5 9  RENT
    T{ 5 PLAN@ 12 ?S }T ;

: TEST-CASH-THEN-RENT
    INITIALIZE
    5 10 RENT
    5 CASH
    T{ PROFIT @ 10 ?S }T ;

: TEST-DO-ACTIONS
    INITIALIZE
    5  10 RENT
    10 14 RENT
    5 CASH
    14 8 RENT
    15 7 RENT
    10 CASH
    14 CASH
    15 CASH
    T{ PROFIT @ 18 ?S }T
    INITIALIZE
 ( 0  )   5 10 RENT
 ( 3  )   10 14 RENT
 ( 5  )   5  CASH
 ( 10 )   10 CASH
    T{ PROFIT @ 14 ?S }T  ;
    
TEST-PLAN
TEST-UPDATE-ONLY-WITH-MAX
TEST-PLAN-IS-GE-PROFIT
TEST-RENT-THEN-CASH
TEST-CASH-THEN-RENT
TEST-DO-ACTIONS






BYE


