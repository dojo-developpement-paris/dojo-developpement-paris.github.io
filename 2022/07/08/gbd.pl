
% swipl -g run_tests -t halt gbd.pl

ligne(albert, [42]).
ligne(beatrice, [11,23]).
ligne(charles, [11,42]).

ou-est(Chauffeur, Minute, Arret) :-
    between(1, 480, Minute),
    ligne(Chauffeur, Ligne),
    length(Ligne, L),
    Index is (Minute - 1) mod L,
    nth0(Index, Ligne, Arret).

rencontre(Minute, Chauffeurs) :-
    bagof(C, ou-est(C, Minute, A), Chauffeurs),
    length(Chauffeurs, L),
    L > 1 .

:- begin_tests(gbd).

%  :- use_module('gossiping'). 


test('un chauffeur avec un seul arrêt s\'arrête toujours au même arret') :-
    ou-est(albert, 1, 42).

test('un chauffeur n\'est pas à un arrêt qui n\'est pas sur sa ligne') :-
    ou-est(beatrice, _, Arret),
    Arret \= 42 .

test('un chauffeur revient sur ses arrêts') :-
    ou-est(albert, 2, 42).

test('un chauffeur ne travaille que 8 heures') :-
    not(ou-est(albert,500,_)).

test('des chauffeurs au même arrêt à la même minute se rencontrent') :-
    rencontre(1,[beatrice, charles]).

test('des chauffeurs à deux arrêts différents à la même minute ne se rencontrent pas') :-
    not(rencontre(1,[albert, beatrice])),
    not(rencontre(1,[C])).

:- end_tests(gbd).
