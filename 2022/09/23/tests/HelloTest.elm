module HelloTest exposing (suite)

import Expect
import Test exposing (Test, describe, test)


newAccount : Account
newAccount =
    { threshold = 0, transactions = [] }


newAccountWith : Int -> Account
newAccountWith threshold =
    { threshold = threshold, transactions = [] }


type Transaction
    = ATransaction Int


type alias Account =
    { threshold : Int
    , transactions : List Transaction
    }


type alias Date =
    String


deposit : Int -> Date -> Account -> Account
deposit amount _ account =
    { account | transactions = ATransaction amount :: account.transactions }


withdrawal : Int -> Date -> Account -> Account
withdrawal amount date account =
    if balance account >= amount then
        deposit -amount date account

    else
        account


balance : Account -> Int
balance account =
    case account.transactions of
        [] ->
            0

        (ATransaction amountA) :: rest ->
            amountA + balance { account | transactions = rest }


suite : Test
suite =
    describe "Account"
        [ test "initial balance is 0" <|
            \_ ->
                Expect.equal (balance newAccount) 0
        , test "deposit of 5 increases balance" <|
            \_ ->
                let
                    account =
                        newAccount
                            |> deposit 5 "2022-09-23"
                in
                Expect.equal (balance account) 5
        , test "deposit of 12 also" <|
            \_ ->
                let
                    account =
                        newAccount
                            |> deposit 12 "2022-09-23"
                in
                Expect.equal (balance account) 12
        , test "several deposits increases balance" <|
            \_ ->
                let
                    account =
                        newAccount
                            |> deposit 12 "2022-09-23"
                            |> deposit 10 "2022-09-24"
                in
                Expect.equal (balance account) 22
        , test "withdrawal decreases balance" <|
            \_ ->
                let
                    account =
                        newAccount
                            |> deposit 12 "2022-09-23"
                            |> deposit 10 "2022-09-24"
                            |> withdrawal 8 "2022-09-24"
                in
                Expect.equal (balance account) 14
        , test "an account can't have negative balance" <|
            \_ ->
                let
                    account =
                        newAccount
                            |> withdrawal 8 "2022-09-24"
                in
                Expect.equal (balance account) 0
        , test "toto" <|
            \_ ->
                let
                    account =
                        newAccountWith 10
                            |> withdrawal 8 "2022-09-24"
                in
                Expect.equal (balance account) -8
        ]
