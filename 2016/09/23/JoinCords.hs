module JoinCords where
import Data.List
import Data.Ord

data End = Male | Female
    deriving (Eq,Show)

type Cord = (End,Int,End)

join cords = orthos ++ paras
    where (orthos,rest) = partition ortho cords
          (mm,ff) = partition maleMale $ orderBySize rest
          paras = assembleAllYouCan mm ff

assembleAllYouCan :: [Cord] -> [Cord] -> [Cord]
assembleAllYouCan mm ff = concat $ zipWith (\c1 c2 -> [c1,c2]) mm ff

maleMale (e,_,e') = e == e' && e == Male

orderBySize = sortBy.flip $ comparing size

size :: Cord -> Int
size (_,s,_) = s

ortho :: Cord -> Bool
ortho (e,_,e') = e /= e'
