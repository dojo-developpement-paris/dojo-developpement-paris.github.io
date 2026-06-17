% to run the tests:
% swipl -g run_tests -t halt bowling_test.pl

:- begin_tests(bowling_score).


:- use_module('bowling'). 

test('given no rolls then score is zero') :-
    score([], 0).

test('given one roll then score is that roll') :-
    score([7], 7).

test('given any roll then score is that roll') :-
    score([5], 5).

test('given two average rolls then score is sum of these rolls') :-
    score([3, 5], 8).

test('given any two average rolls then score is sum of these rolls') :-
    score([2, 7], 9).

test('given a spare then next roll is doubled as bonus', [nondet]) :-
    score([6,4,2,0], 14).

test('given a strike then two next rolls are doubled as bonus', [nondet]) :-
    score([10,3,4], 24).

test('a spare takes place only on new frame', [nondet]) :-
    score([10,0,2],14). 

test('after ten frames, rolls are not counted, only bonus', [nondet]) :-
    score([10,10,10,10,10,10,10,10,10,10,10,10], 300).

:- end_tests(bowling_score).



