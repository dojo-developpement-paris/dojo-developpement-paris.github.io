% swipl -f lags_spec.pro -g run_specs,halt.

:- ensure_loaded('ProSpec.pro').

factorial(N,F) :-
    N == 0,
    F is 1.

factorial(N,F) :-  
   N>0, 
   N1 is N-1, 
   factorial(N1,F1), 
   F is N * F1.

order(af514,0, 5, 10).
order(co5, 3, 7, 14).
order(af515,5, 9, 7).
order(ba01, 6, 9, 8).

sum([],0).
sum([Head|Tail],X) :-
    sum(Tail, Y),
    X is Head +  Y.


sum_prices([],0).
sum_prices([Id|Ids],X) :-
    sum_prices(Ids,Y),
    order(Id,_,_,Price),
    X is Price + Y.

revenue([],0).

revenue([Id1,Id2],X) :-
    order(Id1,_,_,P1),
    order(Id2,_,_,P2),
    P1 > P2,
    X is P1.
revenue([Id1,Id2],X) :-
    order(Id1,_,_,P1),
    order(Id2,_,_,P2),
    P1 =< P2,
    X is P2.

revenue([Id|Tail],X) :-
    X is 18.
    
:- describe('Lags'). 

:- dynamic(setup_spec/0).

setup_spec.

:- it('should compute factorial'/(
	factorial(6,A),
	assert_that(A, equals:720)
)). 

:- it('should compute a sum'/(
    sum([42,17,4807],X),
    assert_that(X, equals:4866)
)).

:- it('should compute the sum of order prices'/(
    sum_prices([af514,co5,af515,ba01],X),
    assert_that(X, equals:39)
)).

:- it('revenue should select the best price '/(
    revenue([af514,co5],X),
    assert_that(X, equals:14)
)).

:- it('revenue should select the best price with several orders'/(
    revenue([af514,co5,af515,ba01],X),
    assert_that(X, equals:18)
)).
:- end_describe.


