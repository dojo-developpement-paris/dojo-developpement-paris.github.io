module Conway (conway)
where
import Data.List (group)

conway x = take x conwayList

conwayList = "1" : map nextLine conwayList

nextLine line = group line >>= (\g -> (show $ length g) ++ [head g])
 

conwayList' = "1" : [ nextLine l | l <- conwayList'  ]

conwayList'' = scanl (\acc _ -> nextLine acc) "1" [1..]


