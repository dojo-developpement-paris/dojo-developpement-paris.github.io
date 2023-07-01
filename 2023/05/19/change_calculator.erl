-module(change_calculator).
-include_lib("eunit/include/eunit.hrl").
-export([]).

changeCombinationsCount(0, _) -> 1;
changeCombinationsCount(_, []) -> 0;
changeCombinationsCount(Sum, _) when Sum < 0 -> 0;
changeCombinationsCount(Sum, [First|Tail]) ->
    changeCombinationsCount(Sum-First, [First|Tail])
    + changeCombinationsCount(Sum, Tail).

all_test_() ->
    [?_assertEqual(changeCombinationsCount(1, [1]), 1)
    ,?_assertEqual(changeCombinationsCount(5, [1]), 1)
    ,?_assertEqual(changeCombinationsCount(6, [2]), 1)
    % Case where smallest coin is bigger than the sum
    ,?_assertEqual(changeCombinationsCount(1, [2]), 0)
    ,?_assertEqual(changeCombinationsCount(2, [5]), 0)
    % Case where the sum cannot be decomposed in available coins
    ,?_assertEqual(changeCombinationsCount(5, [2]), 0)
    ,?_assertEqual(changeCombinationsCount(3, [2]), 0)
    % Case where there are two types of coin
    ,?_assertEqual(changeCombinationsCount(2, [2, 1]), 2)
    ,?_assertEqual(changeCombinationsCount(2, [1, 2]), 2)
    ,?_assertEqual(changeCombinationsCount(3, [2, 1]), 2)
    ,?_assertEqual(changeCombinationsCount(4, [2, 1]), 3)
    ,?_assertEqual(changeCombinationsCount(3, [10, 5]), 0)
    ,?_assertEqual(changeCombinationsCount(7, [3, 1]), 3)
    ,?_assertEqual(changeCombinationsCount(10, [3, 1]), 4)
    ,?_assertEqual(changeCombinationsCount(8, [2, 1]), 5)
    ,?_assertEqual(changeCombinationsCount(4, [5, 1]), 1)
    % Case where there are three types of coin
    ,?_assertEqual(changeCombinationsCount(6, [3, 2, 1]), 7)
    ,?_assertEqual(changeCombinationsCount(7, [3, 2, 1]), 8)
    % nominal case
    ,?_assertEqual(changeCombinationsCount(300, [5,10,200,50,100,20,500]), 1022)
    ,?_assertEqual(changeCombinationsCount(300, [500,200,100,50,20,10,5]), 1022)
    ,?_assertEqual(changeCombinationsCount(301, [500,200,100,50,20,10,5]), 0)
    ].
