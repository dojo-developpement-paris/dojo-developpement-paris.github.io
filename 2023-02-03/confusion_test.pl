% to run the tests:
% swipl -g run_tests -t halt confusion_test.pl

:- begin_tests(confusion).


:- use_module('confusion'). 

test('1+2 solves 12=3') :-
    solve([1,2], 12, 3).

test('2+1 solves 21=3') :-
    solve([2,1], 21, 3).

test('A+B solves XX = D implies A+B = D') :-
    solve([3,2], _, 5).
    
test('A+B solves XX = D for any D') :-
    solve([A,B], _, 5).

test('A+B solves AB = D for any D') :-
    solve([A,B], A*10+B, 5),
    not(solve([A,B], B*10+A, 5)).

test('simple equality') :-
    equals(2,2).

:- end_tests(confusion).

