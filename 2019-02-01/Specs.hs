import Test.QuickCheck
import Bowling

data Frame = Regular Integer Integer
           | Spare Integer
           | Strike
    deriving (Eq, Show)

regular :: Gen Frame
regular = do
    t1 <- choose (0,9)
    t2 <- choose (0,9-t1)
    return (Regular t1 t2)

spare :: Gen Frame
spare = do
    t <- choose (0,9)
    return (Spare t)

regulars = listOf regular

spares = (listOf spare) `suchThat` (\l -> length l > 0 && length l < 10)

strike :: Gen Frame 
strike = do
    return Strike

strikes = (listOf strike) `suchThat` (\l -> length l > 1 && length l < 9)

instance Arbitrary Frame where
    arbitrary = oneof [regular,spare,strike]

frames :: Gen [Frame]
frames = listOf arbitrary

throws :: Frame -> [Integer]
throws (Regular t1 t2) = [t1,t2]
throws (Spare t) = [t,10-t]
throws Strike = [10]

propRegularFrames :: Property
propRegularFrames = forAll regulars $ \frames -> 
    let
        ts = concatMap throws frames
    in score ts == sum (take 20 ts)

propSpareFrames :: Property
propSpareFrames = forAll spares $ \frames ->  
    let ts = concatMap throws frames
        bs = map (\(Spare throw) -> throw) (tail frames)
    in score ts == sum ts + sum bs

propStrikeFrames :: Property
propStrikeFrames = forAll strikes $ \frames ->
    let ts = concatMap throws frames
        bs = tail ts ++ tail (tail ts)
    in score ts == sum ts + sum bs

propAfterTenRegulars :: Property
propAfterTenRegulars = forAll regulars $ \frames ->
    let ts = concatMap throws frames
    in score ts == sum (take 20 ts)

propMaxScoreIs300 :: Property
propMaxScoreIs300 = forAll (listOf strike)  $ \frames ->
    let ts = concatMap throws frames
    in  score ts <= 300

testRegularIsLessThanTen :: Property
testRegularIsLessThanTen = forAll regular $ \(Regular throw1 throw2) -> throw1 + throw2 < 10 
main = do
    quickCheck testRegularIsLessThanTen
    quickCheck propRegularFrames 
    quickCheck propSpareFrames
    quickCheck propStrikeFrames
    quickCheck propAfterTenRegulars
    quickCheck propMaxScoreIs300
