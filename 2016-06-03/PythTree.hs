module PythTree
where
import Data.List (intersperse)

type Shape = [Point]
type Point = (Double, Double)

element :: String -> String -> String
element e s = "<" ++ e ++ ">" ++ s ++ "</" ++ e ++ ">"

attribute :: Show(a) => String -> a -> String
attribute a v = " " ++ a ++ "=\"" ++ (show v) ++ "\""

stringAttribute :: String -> String -> String
stringAttribute a v = " " ++ a ++ "=\"" ++ v ++ "\""

(.!.) = element
infixr  4 .!. 

(.@.) :: Show(a) => String -> a -> String
(.@.) = attribute
infixr 6 .@.

render :: Int -> Int -> [Shape] -> String
render w h sh = "html" .!. "body" .!. (renderSvg w h sh) 
    where
    renderSvg :: Int -> Int -> [Shape] -> String
    renderSvg w h sh = "<svg" ++ "width" .@. w
                              ++ "height" .@. h
                              ++ ">"
                              ++ renderShapes sh          
                              ++ "</svg>"
    renderShapes :: [Shape] -> String
    renderShapes = concatMap renderShape
    renderShape sh = "<polygon" ++ renderPoints sh ++ stringAttribute "style" "fill:white;stroke:black" ++ "/>"
    
    renderPoints :: Shape -> String
    renderPoints pts = stringAttribute "points" (concat (intersperse " " (map showPoint pts)))
    
    showPoint :: Point -> String
    showPoint (x,y) = show x ++ "," ++ show y

square :: Point -> Double -> Shape
square (x0,y0) d = [(x0,y0),(x0+d,y0),(x0+d,y0+d),(x0,y0+d)]

rightTriangle :: Point -> Double -> Double -> Shape
rightTriangle (x0,y0) h a = [(x0,y0),(x0+h,y0),(x1,y1)]
    where
    (x1,y1) = (x0+(h*cos a)*cos a, y0+(h*cos a)*sin a)
          
house :: Point -> Double -> Double -> Shape
house (x0,y0) h a = take 3 sq ++ [tr !! 2] ++ [(x0,y0+h)]
    where
    sq = square (x0,y0) h
    tr = rightTriangle (x0,y0+h) h a
         
 

 
