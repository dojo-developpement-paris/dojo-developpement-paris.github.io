threaten((X1, Y1), (X2, Y2)) :-
    X1 = X2;
    Y1 = Y2;

    Ysum is Y2-Y1,
    Xsum is X2-X1,
    (Ysum = Xsum; 0 is Ysum + Xsum).

threaten_in(N, (X1, Y1), (X2, Y2)) :- 
    integer(Y1),
    X1 =< N, X2 =<N, Y1 =< N, Y2=<N,
    X1 >= 1, X2 >=1, Y1 >= 1, Y2>=1.

num2list(N, List) :-
    num2list(0, N, List).

num2list(N, N, [N]).
num2list(N0, N, [N0| List]) :-
    N0 < N,
    N1 is N0 + 1,
    num2list(N1, N, List).

tests() :-
    % same line
    threaten((2,3), (2,4)),
    % same column 
    threaten((2,3), (8,3)),
    % diagonal1
    threaten((2,3), (3,4)),
    threaten((2,3), (4,5)),
    threaten((1,1), (8,8)),
    % diagonal2
    threaten((2,1), (1,2)),
    threaten((1,8), (8,1)),
    threaten((3,4), (4,3)),
    % false examples
    not(threaten((1,1), (2,3))).

