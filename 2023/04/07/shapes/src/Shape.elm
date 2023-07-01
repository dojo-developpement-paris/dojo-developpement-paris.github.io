module Shape exposing (Point, Shape, merge)


type alias Point =
    ( Int, Int )


type alias Shape =
    List Point


merge : Shape -> Shape -> Shape
merge shape1 shape2 =
    [ ( 0, 0 ), ( 1, 0 ), ( 2, 0 ), ( 2, 1 ), ( 1, 1 ), ( 1, 0 ) ]
