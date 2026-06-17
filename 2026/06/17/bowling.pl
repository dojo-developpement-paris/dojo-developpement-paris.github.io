% bowling.pl
:- module(bowling, [score/2]).

score([], 0).

% strike rule
score([Roll1 , Roll2 , Roll3 | Rest], Score) :-
    10 is Roll1,
    score([Roll2, Roll3 | Rest], ScoreRest),
    Score is 10 + Roll2 + Roll3 + ScoreRest.

% spare rule
score([Roll1 , Roll2 , Roll3 | Rest], Score) :-
    Roll1 \= 10,
    10 is Roll1 + Roll2,
    score([Roll3 | Rest], ScoreRest),
    Score is 10 + Roll3 + ScoreRest.

% average roll
score([Roll|Rest], Score) :-
    Roll \= 10,
    score(Rest, ScoreRest),
    Score is Roll + ScoreRest.

