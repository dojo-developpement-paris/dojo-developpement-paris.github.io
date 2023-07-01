module Baobab where

import Graphics.Collage (..)
import List

type alias Point = (Float,Float)
type alias Taille = Float 
type alias Angle = Float
type alias Niveau = Int

baobab45 : Niveau -> Point -> Taille -> List Path
baobab45 niveau (x,y) t = 
    case niveau of
        0 -> [] 
        _ -> let
                 angle = degrees 35
                 maison = maisonSansBase (x,y) t angle
                 xS = x + t * cos angle * cos angle
                 yS = t + y + t * cos angle * sin angle
                 sommet = (xS,yS)
                 gauche = List.map (rotations (x,y+t) angle) <| baobab45 (niveau-1) (x,y+t) (t * cos angle)
                 droite = List.map (rotations sommet (angle - (degrees 90))) <| baobab45 (niveau-1) sommet (t * sin angle)

             in maison ++ gauche ++ droite

rotations : Point -> Angle -> Path -> Path
rotations (x,y) a p = 
    let rotation : Point -> Angle -> Point -> Point
        rotation (x0,y0) phi (x,y) =
            let cosPhi = cos phi
                sinPhi = sin phi
                dx   = x0 - x0 * cosPhi + y0 * sinPhi
                dy   = y0 - x0 * sinPhi - y0 * cosPhi
            in (x * cosPhi - y * sinPhi + dx, x * sinPhi + y * cosPhi + dy)
    in List.map (rotation (x,y) a) p

maisonSansBase : Point -> Taille -> Angle -> List Path
maisonSansBase (x,y) t a =
    let carre = carreSansBase (x,y) t 
        triangle = triangleSansBase (x,y+t) t a
    in [carre, triangle]

carreSansBase : Point -> Taille -> Path
carreSansBase (x,y) t = [(x+t,y), (x+t,y+t), (x,y+t),(x,y) ]

triangleSansBase : Point -> Taille -> Angle -> Path
triangleSansBase (x,y) t a = 
    let 
        xS = x + t * cos a * cos a
        yS = y + t * cos a * sin a
    in [(x+t,y),(xS,yS),(x,y)] 
