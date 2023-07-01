module Spec exposing (..)

import Expect
import Task
import Test exposing (..)


spec =
    describe "testing commands"
        [ test "messages are easy to test" <|
            \_ ->
                let
                    oldModel =
                        { msgs = [] }

                    ( newModel, _ ) =
                        update (ReceiveMail Paris "hello") oldModel
                in
                Expect.equal newModel { oldModel | msgs = [ "hello" ] }
        , test "when a message arrives, send an Ack" <|
            \_ ->
                let
                    oldModel =
                        { msgs = [] }

                    ( _, command ) =
                        update (ReceiveMail Paris "hello") oldModel
                in
                Expect.equal command (DoAnAck 32)
        , test "ackAck" <|
            \_ ->
                let
                    oldModel =
                        { msgs = [] }

                    ( _, command ) =
                        update AckAck oldModel
                in
                Expect.equal command None
        ]


type alias Model =
    { msgs : List String }


type Message
    = ReceiveMail City String
    | AckAck


type MyEffect
    = None
    | DoAnAck Int


type City
    = Paris


update : Message -> Model -> ( Model, MyEffect )
update msg model =
    case msg of
        ReceiveMail Paris str ->
            ( { model | msgs = str :: model.msgs }
            , DoAnAck 32
            )

        AckAck ->
            ( model, None )


internalToRuntime : ( Model, MyEffect ) -> ( Model, Cmd Message )
internalToRuntime ( m, effect ) =
    case effect of
        DoAnAck _ ->
            ( m, createEffect )

        None ->
            ( m, Cmd.none )


createEffect : Cmd Message
createEffect =
    Task.perform (always <| AckAck) <| Task.succeed 0


externalUpdate : Message -> Model -> ( Model, Cmd Message )
externalUpdate msg model =
    internalToRuntime <| update msg model
