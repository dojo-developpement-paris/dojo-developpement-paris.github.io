module ShadokSum where

data Unit = GA | BU | ZO | MEU
  deriving (Show, Eq, Enum)

type Number = [Unit]

shSum::Number->Number->Number
shSum [GA] x = x
shSum x [GA] = x

shSum [ZO] [ZO] = [BU, GA]

shSum [MEU] [x] = [BU, pred x]
shSum [x] [MEU] = [BU, pred x]

shSum [x] [BU] = [succ x]
shSum [BU] [x] = [succ x]

shSum [x1, x2] [y1, y2] | hasCarry [x2] [y2]= [x1] `shSum` [succ y1] ++ [pred y2]
                        where hasCarry y1 y2 =  length (  y1 `shSum` y2 ) == 2
shSum (x:xs) (y:ys) = [x] `shSum` [y] ++ xs `shSum` ys

