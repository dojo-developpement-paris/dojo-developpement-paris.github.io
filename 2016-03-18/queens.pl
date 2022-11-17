:- use_module(library(clpfd)).

descending(Column,Row,Diagonal)
	:- Diagonal #=  Column - Row.

ascending(Column,Row,Diagonal)
	:- Diagonal #=  Column + Row.

diagonals(_,[],[],_) :- !.
diagonals(Constraint,[Queen|BoardTail],[Diagonal|DiagonalTail],N) :- 
	call(Constraint,N,Queen,Diagonal),
	Next is N + 1,
	diagonals(Constraint,BoardTail,DiagonalTail,Next).

diagonals(Constraint,Board,Diagonals) :- 
	diagonals(Constraint,Board,Diagonals,1).

no_diagonals(Constraint,Board) :-
	diagonals(Constraint,Board,Diagonals),
	all_different(Diagonals).

no_diagonals(Board) :- 
	no_diagonals(descending,Board),
	no_diagonals(ascending,Board).

within_limits(N,Board) :- length(Board,N), Board ins 1..N.

queens(N,Board) :- within_limits(N,Board), all_different(Board),
		no_diagonals(Board).

:- begin_tests(nQueens).

test(should_solve_a_8_queens_problem_with_good_size) :- 
	queens(8,Board), 
	length(Board,N), 
	assertion( N == 8). 
test(should_solve_a_4_queens_problem_with_good_size) :- 
	queens(4,Board), 
	length(Board,N), 
	assertion( N == 4). 
test(should_place_on_the_board_upper_limit, [fail]) :- 
	queens(4,[5|_]).
test(should_place_on_the_board_upper_limit_on_8) :- 
	queens(8,[8|_]).
test(should_place_on_the_board_lower_limit, [fail]) :- 
	queens(4,[0|_]).
test(should_not_place_on_same_row, [fail]) :- 
	queens(4,[1,1|_]).
test(should_not_place_on_same_descending_diagonal, [fail]) :-
	queens(4,[1,2|_]).
test(should_not_place_on_same_descending_diagonal_on_other_diagonal, [fail]) :-
	queens(4,[_,1,2|_]).
test(should_not_place_on_same_ascending_diagonal, [fail]) :-
	queens(8,[4,3|_]).
:- end_tests(nQueens).
