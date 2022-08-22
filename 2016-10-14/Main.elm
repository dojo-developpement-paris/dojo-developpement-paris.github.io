import Html exposing (Html)
import Html.App as App
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import List exposing (concat, indexedMap, map)
import GameOfLife exposing (..)

main = App.program { init          = init
                   , view          = view
                   , update        = update
                   , subscriptions = subscriptions }

type alias World = List (List Cell)
type Msg = ToggleCell CoordY CoordX
         | Generate

littleWorld =
  [ [Live,Live,Dead,Live,Dead]
  , [Dead,Live,Dead,Live,Dead]
  , [Dead,Dead,Live,Dead,Live]
  , [Dead,Live,Dead,Live,Dead]
  ]

init : (World, Cmd Msg)
init = (littleWorld, Cmd.none)

update : Msg -> World -> (World, Cmd Msg)
update msg cells =
  case msg of
    ToggleCell y x -> (updateWorld y x cells, Cmd.none)
    Generate       -> (generation cells, Cmd.none)

updateWorld : CoordY -> CoordX -> World -> World
updateWorld y x w = indexedMap (\nl l -> indexedMap (\nc c -> updateCell y x nl nc c) l ) w

updateCell : CoordY -> CoordX -> CoordY -> CoordX -> Cell -> Cell
updateCell y x nl nc c = if y == nl && x == nc then toggle c else c

toggle c = case c of
  Dead -> Live
  Live -> Dead

subscriptions : World -> Sub Msg
subscriptions _ = Sub.none

view : World -> Html Msg
view w = let
            attributes = [width "300", height "300"]
            button     = circle [cx "200", cy "200", r "15", fill "red", Svg.Events.onClick (Generate)] []
            contents   = svgWorld w
         in svg attributes (button :: contents)

svgCell : IndexedCell -> Html Msg
svgCell (y,x,alive) = case alive of
                        Live -> drawCell y x "green"
                        Dead -> drawCell y x "white"

svgWorld : World -> List (Html Msg)
svgWorld w = map svgCell (indexWorld w)

drawCell : CoordY -> CoordX -> String -> Html Msg
drawCell y x color= circle
  [ cx (toCoord x)
  , cy (toCoord y)
  , r "15"
  , fill color
  , stroke "green"
  , Svg.Events.onClick (ToggleCell y x)
  ]
  []

toCoord : Coord -> String
toCoord x = toString  (15 + (x * 30))

type alias Coord = Int
type alias CoordX = Int
type alias CoordY = Int
type alias IndexedCell = (CoordY,CoordX,Cell)

indexLine : CoordY -> (CoordX,Cell) -> IndexedCell
indexLine y (x,cell) = (y,x,cell)

indexWorld : World -> List IndexedCell
indexWorld w = concat (
    indexedMap (\y l -> map (indexLine y) l) (map (indexedMap (,)) w)) 
