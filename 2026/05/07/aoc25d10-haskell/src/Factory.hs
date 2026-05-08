module Factory (switch)
    where

type Light = Bool
type Lights = [Light]
type Button = [Int]


index :: [a] -> [(Int, a)]
index l = zip [0..] l

-- [(0,F),(1,F),(2,F)] [0,2]
--  


switch_aux :: [(Int,Light)] -> Button -> Lights
switch_aux [] _ = []
switch_aux ((number,light) : rest) button | number `elem` button = not light : switch_aux rest button
switch_aux ((number,light) : rest) button = light : switch_aux rest button


switch :: Lights -> Button -> Lights
switch lights button = switch_aux (index lights) button
