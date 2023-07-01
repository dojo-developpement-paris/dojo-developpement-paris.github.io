row([A,B,C,D|Tail],N,Row) :- N = 0, !, Row = [A,B,C,D].
row([_,_,_,_|Tail],N,Row) :- N2 is N - 1, row(Tail,N2,Row).

col([A,_,_,_,B,_,_,_,C,_,_,_,D|_],N,Col) :- N = 0,!, Col = [A,B,C,D].
col([_|Tail],N,Col) :- N2 is N - 1, col(Tail,N2,Col).

sqr([A,B,_,_,C,D|_],N,Sqr) :- N = 0,!, Sqr = [A,B,C,D].
sqr([_,_,A,B,_,_,C,D|_],N,Sqr) :- N = 1,!, Sqr = [A,B,C,D].
sqr([_,_,_,_,_,_,_,_|Tail],N,Sqr) :- N2 is N - 2, sqr(Tail,N2,Sqr).

rows(_,_,0) :- !.
rows(Grid,[Row|Tail],N) :- Next is N - 1,NR is N - 1, row(Grid,NR,Row), rows(Grid,Tail,Next).

cols(_,_,0) :- !.
cols(Grid,[Col|Tail],N) :- Next is N - 1,NC is N - 1, col(Grid,NC,Col), cols(Grid,Tail,Next).

sqrs(_,_,0) :- !.
sqrs(Grid,[Sqr|Tail],N) :- Next is N - 1,NS is N - 1, sqr(Grid,NS,Sqr), sqrs(Grid,Tail,Next).

all_all_different([]).
all_all_different([A|Tail]) :- fd_all_different(A), all_all_different(Tail).

sudoku(Grid) :- 
		length(Grid,16),
		cols(Grid,[Col1,Col2,Col3,Col4],4),
		rows(Grid,[Row4,Row3,Row2,Row1],4),
		sqrs(Grid,[Sqr4,Sqr3,Sqr2,Sqr1],4),
		fd_domain(Grid,1,4),
		all_all_different([
		Col1
		,Col2
		,Col3
		,Col4
		,Row1
		,Row2
		,Row3
		,Row4
		,Sqr1
		,Sqr2
		,Sqr3
		,Sqr4]).


test :-
	col([1,_,_,_,2,_,_,_,3,_,_,_,4,_,_,_],0,[1,2,3,4]),
	col([4,1,_,_,_,2,_,_,_,3,_,_,_,4,_,_],1,[1,2,3,4]),
	row([1,2,3,4,5],0,[1,2,3,4]), 
	row([1,2,3,4,5,6,7,8],1,[5,6,7,8]), 
	sudoku([1,2,3,4,3,4,1,2,2,1,4,3,4,3,2,1]),
	\+sudoku([1,2,3,4,
		  1,3,4,2,
		  2,3,4,1,
		  1,3,2,4]),
	\+sudoku([1,2,3,4,
		  1,3,4,2,
		  2,3,4,1,
		  1,3,2,3]),
	\+sudoku([1,2,3,4,
		  2,3,4,2,
		  3,3,4,1,
		  4,3,2,3]),
	\+sudoku([1,1,3,4,
		  2,2,4,2,
		  3,3,4,1,
		  4,4,2,3]),
	\+sudoku([1,1,1,4,
		  2,2,2,2,
		  3,3,3,3,
		  4,4,4,3]),
	\+sudoku([1,1,1,4,
		  2,2,2,2,
		  3,3,3,1,
		  4,4,4,3]),
	\+sudoku([1,2,3,4,
		  2,1,2,2,
		  3,3,1,1,
		  4,4,4,3]),
	\+sudoku([1,2,3,4,
		  2,1,4,3,
		  3,4,1,2,
		  4,3,2,1]),
	!.
