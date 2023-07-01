module Main exposing (main,object,radius)

import Browser
import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..) 

type alias Object = { mass : Int } 

object m = { mass = m }

radius o = round(sqrt (toFloat o.mass))

type alias Model = List Object

initialModel : Model
initialModel = [object 25, object 16]

type Msg = UndefinedMsg

update : Msg -> Model -> Model
update msg model = model

planet : Object -> Svg Msg
planet o = circle [cx "100", cy "100", r (String.fromInt(radius o * 10)), fill "white", stroke "black", strokeWidth "2" ] []

view : Model -> Html Msg
view model = svg [viewBox "0 0 200 200", width "200", height "200"]
                 (List.map planet model)

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

