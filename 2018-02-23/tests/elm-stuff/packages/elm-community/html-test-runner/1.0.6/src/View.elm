module View exposing (view)

import Color exposing (Color, rgb)
import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import String
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Test.Runner.Exploration as Runner
import Test.Runner.Html.View as View
import Time exposing (Time)


view : View.Model -> Html a
view model =
    Element.viewport stylesheet (app model)


type Styles
    = None
    | App
    | Header Palette
    | Description Palette


type Palette
    = Primary
    | Secondary
    | Accent
    | Background
    | Good
    | Bad
    | Warning


color : Palette -> Color
color palette =
    case palette of
        Primary ->
            rgb 41 60 75

        Secondary ->
            -- gray color on elm blog is rgb 221 221 221 but it doesn't meet
            -- accessibility standards for contrast http://webaim.org/resources/contrastchecker/
            rgb 84 84 84

        Accent ->
            rgb 96 181 204

        Background ->
            rgb 255 255 255

        Good ->
            rgb 0 100 0

        Bad ->
            rgb 179 0 0

        Warning ->
            rgb 122 67 0


withColor :
    (Palette -> class)
    -> List (Property class variation)
    -> List (Style class variation)
withColor toStyle attributes =
    let
        withColorHelp p =
            style
                (toStyle p)
                (Color.text (color p) :: attributes)
    in
    List.map withColorHelp
        [ Primary
        , Secondary
        , Accent
        , Background
        , Good
        , Bad
        , Warning
        ]


stylesheet : StyleSheet Styles variation
stylesheet =
    [ [ style None
            []
      , style App
            [ Color.text (color Primary)
            , Color.border (color Accent)
            , Font.typeface
                [ "Source Sans Pro"
                , "Trebuchet MS"
                , "Lucida Grande"
                , "Bitstream Vera Sans"
                , "Helvetica Neue"
                , "sans-serif"
                ]
            , Border.top 8
            ]
      ]
    , withColor Description
        []
    , withColor Header
        [ Font.size 24
        , Font.bold
        , paddingBottomHint 24
        ]
    ]
        |> List.concat
        |> Style.stylesheet


app : View.Model -> Element Styles variations msg
app model =
    let
        wrapper nested =
            row App
                [ padding 20 ]
                [ el None [ width (fill 1) ] empty
                , el None [ width (px 960) ] nested
                , el None [ width (fill 1) ] empty
                ]
    in
    wrapper <|
        case model of
            Nothing ->
                "Loading Tests..."
                    |> text
                    |> el (Header Primary) []
                    |> header
                    |> summary []

            Just ( duration, Runner.Pass passed ) ->
                ( Good, "Test Run Passed" )
                    |> finished duration passed []
                    |> summary []

            Just ( duration, Runner.Todo passed failures ) ->
                ( Warning, "Test Run Incomplete: TODO's remaining" )
                    |> finished duration passed failures
                    |> summary failures

            Just ( duration, Runner.Incomplete passed Runner.Only ) ->
                ( Warning, "Test Run Incomplete: Test.only was used" )
                    |> finished duration passed []
                    |> summary []

            Just ( duration, Runner.Incomplete passed Runner.Skip ) ->
                ( Warning, "Test Run Incomplete: Test.skip was used" )
                    |> finished duration passed []
                    |> summary []

            Just ( duration, Runner.Incomplete passed (Runner.Custom reason) ) ->
                ( Warning, "Test Run Incomplete: " ++ reason )
                    |> finished duration passed []
                    |> summary []

            Just ( duration, Runner.Fail passed failures ) ->
                ( Bad, "Test Run Failed" )
                    |> finished duration passed failures
                    |> summary failures

            Just ( duration, Runner.Running { passed, failures, remaining } ) ->
                running (passed + List.length failures) remaining
                    |> summary failures


running : Int -> Int -> Element Styles variations msg
running completed remaining =
    column None
        []
        [ header <| el (Header Primary) [] (text "Running Tests...")
        , row None [] [ text (toString completed ++ " completed") ]
        , row None [] [ text (toString remaining ++ " remaining") ]
        ]


finished : Time -> Int -> List a -> ( Palette, String ) -> Element Styles variation msg
finished duration passed failures ( headlineColor, headlineText ) =
    column None
        []
        [ row (Header headlineColor) [] [ header (text headlineText) ]
        , row None
            []
            [ table None
                [ spacing 10 ]
                [ [ bold "Duration", bold "Passed", bold "Failed" ]
                , [ text (formattedDuration duration)
                  , text (toString passed)
                  , text (toString (List.length failures))
                  ]
                ]
            ]
        ]


summary : List Runner.Failure -> Element Styles variation msg -> Element Styles variation msg
summary failures message =
    column None
        []
        [ wrappedRow None [] [ message ]
        , wrappedRow None [] [ allFailures failures ]
        ]


allFailures : List Runner.Failure -> Element Styles variation msg
allFailures failures =
    List.map (oneFailure >> node "li") failures
        |> column None
            [ spacing 10
            , padding 10
            ]
        |> node "ol"


oneFailure : Runner.Failure -> Element Styles variations msg
oneFailure failure =
    let
        ( labels, expectations ) =
            Runner.formatFailure
                (coloredLabel '↓' Secondary)
                (coloredLabel '✗' Bad)
                failure

        inContext { given, message } =
            column None
                [ spacing 10 ]
                [ wrappedRow None [] [ whenJust given givenCode ]
                , wrappedRow None [] [ code None message ]
                ]
    in
    el None
        [ inlineStyle
            [ ( "display", "list-item" )
            , ( "margin", "10px" )
            , ( "padding", "10px" )
            ]
        ]
    <|
        column None
            [ spacing 5 ]
            (labels ++ [ spacer 3 ] ++ List.map inContext expectations)


givenCode : String -> Element Styles variations msg
givenCode value =
    code None ("Given " ++ value)


coloredLabel : Char -> Palette -> String -> Element Styles variation msg
coloredLabel char textColor str =
    column (Description textColor)
        []
        [ text (String.cons char (String.cons ' ' str)) ]


formattedDuration : Time -> String
formattedDuration time =
    toString time ++ " ms"


code : style -> String -> Element style variations msg
code style str =
    node "pre" <|
        el style
            [ inlineStyle [ ( "white-space", "pre-wrap" ) ]
            ]
            (text str)
