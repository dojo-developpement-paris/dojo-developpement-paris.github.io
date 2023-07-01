
human(xavier).
human(christophe).
human(michel).
human(christine).
human(paul).

parent(xavier,christophe).
parent(michel,christine).
parent(christophe,michel).

ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
ancestor(X,Y) :- parent(X,Y).

test :- human(xavier), \+human(julien),
	ancestor(xavier,christophe),
	\+ancestor(xavier,xavier),
	ancestor(xavier,michel),!.
