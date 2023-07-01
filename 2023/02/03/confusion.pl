:- module(confusion,[solve/3, equals/2]).
:- use_module(library(clpfd)).

solve([A,B],EQUATION,RESULTAT) :-
    EQUATION #= A * 10 + B,
    RESULTAT #= A + B.

equals(A,B) :-
    A is B.
