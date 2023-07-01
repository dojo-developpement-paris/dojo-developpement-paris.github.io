import Test.Hspec
import Data.Word

type Signal = [Integer]
type Message = [Word8]
type Pattern = ((Integer,Integer),Maybe (Integer,Integer))

decode :: Signal -> Message
decode (a:b:xs) = let zero = (a,b)
    in return (foldl (\x y -> 2*x+y) 0 (map (\element -> if element == zero then 0 else 1) (groupByTwo xs)))

groupByTwo [] = []
groupByTwo (x:y:xs) = (x,y):groupByTwo xs

main = hspec $ do
    describe "decode" $ do
        it "should decode 8 times 1000,1500" $ do
            let signal = concat $ replicate 8 [1000,1500]
            decode signal  `shouldBe` [0]

        it "should decode 7 times 1000,1500" $ do
            let signal = (concat (replicate 7 [1000,1500]))++[2000,500]
            decode signal  `shouldBe` [1]

        it "should decode 2" $ do
            let signal = (concat (replicate 6 [1000,1500]))++[2000,500,1000,1500]
            decode signal  `shouldBe` [2]

        it "should decode 8 times 1000,1500" $ do
            let signal = [2000,500] ++ (concat $ replicate 7 [1000,1500])
            decode signal  `shouldBe` [127]
