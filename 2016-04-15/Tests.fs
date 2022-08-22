
require ffl/tst.fs
require Rent.fs
page cr

: should CR ;
: tests
    should ." when initialize, profit is 0 and plan values are 0" 
    4807 PROFIT !
    INITIALIZE 
    T{ PROFIT @ 0 ?S
       0 PLAN@ 0 ?S
       7 PLAN@ 0 ?S    
    }T 
    
    should ." planning a rent from t with duration d updates plan at t+d "
    INITIALIZE
    0 5 100 RENT-AIRPLANE
    T{ 5 PLAN@ 100 ?S }T 

    should ." update of plan is only if value is greater"
    INITIALIZE
    0 5 100 RENT-AIRPLANE
    0 5  80 RENT-AIRPLANE
    T{ 5 PLAN@ 100 ?S }T 

    should ." update profit when cash at a given time" 
    INITIALIZE
    0 5 100 RENT-AIRPLANE
    5 UPDATE-PROFIT
    T{ PROFIT @ 100 ?S }T 

    should ." update profit only if value is greater" 
    INITIALIZE
    0 5 100 RENT-AIRPLANE
    0 7  80 RENT-AIRPLANE
    5 UPDATE-PROFIT
    7 UPDATE-PROFIT
    T{ PROFIT @ 100 ?S }T 

    should ." plan a rent with price + current profit"
    INITIALIZE
    0 5 100 RENT-AIRPLANE
    5 UPDATE-PROFIT
    5 9  80 RENT-AIRPLANE
    T{ 14 PLAN@ 180 ?S }T 

    should ." pass the demo test"
    INITIALIZE
     0 5 100 RENT-AIRPLANE
     3 7 140 RENT-AIRPLANE
     5 UPDATE-PROFIT
     5 9  80 RENT-AIRPLANE
     6 9  70 RENT-AIRPLANE
    10 UPDATE-PROFIT
    14 UPDATE-PROFIT
    15 UPDATE-PROFIT
    T{ PROFIT @ 180 ?S }T 

    
    should ." store a value of n bits into a cell"
    10 15  4 <FIELD 
    T{ 250 ?S }T 
    3 2 1 8 <FIELD 8 <FIELD 
    T{ 65536 256 2 * + 3 + ?S }T 

    should ." a cash action at t is lower than rent action at t"
    5 0 0 ACTION>KEY
    5 1 1 ACTION>KEY
    T{ < -1 ?S }T 

    should ." extract a value from a cell" 
    250 4 FIELD> 
    T{ 15 ?S 10 ?S }T 
    65536 256 2 * + 3 + 
    8 FIELD> 8 FIELD> .S
    T{ 1 ?S 2 ?S 3 ?S }T

    should ." decode an action key" 
    5 9 80 ACTION>KEY KEY>ACTION
    T{ 80 ?S 9 ?S 5 ?S }T

    should ." execute action does rent and cash" 
    INITIALIZE 
    0 5 100 EXECUTE-ACTION
    5 0 0   EXECUTE-ACTION
    T{ PROFIT @ 100 ?S }T 
    
    should ." add order generates two actions" 
    INITIALIZE
    0 5 100 ADD-ORDER
    T{ ACTIONS ACT-LENGTH@ 2 ?S }T

    should ." process all actions" 
    INITIALIZE
     0 5 100 ADD-ORDER
     3 7 140 ADD-ORDER
     5 9  80 ADD-ORDER
     6 9  70 ADD-ORDER
    COMPUTE-PROFIT 
    T{ PROFIT @ 180 ?S }T


    
 


;

tests
bye

