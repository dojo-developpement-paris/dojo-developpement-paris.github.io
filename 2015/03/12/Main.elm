import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Baobab as B
import List


main : Element
main = collage 1000 1000 <| List.map (traced (solid green)) <| B.baobab45 10 (0,0) 100  

