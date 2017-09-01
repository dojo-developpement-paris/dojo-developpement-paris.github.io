import Test.Hspec
import Test.QuickCheck
import Bowling

data Throw = Throw Int
    deriving (Eq, Show)

data NormalFrame = Normal Int Int
    deriving (Eq, Show)

instance Arbitrary NormalFrame where
    arbitrary = do
        t <- elements [0..9]
        u <- elements [0..(9-t)] 
        return $ Normal t u

data Strike = Strike Int
    deriving (Eq,Show)

instance Arbitrary Strike where
    arbitrary = return $ Strike 10

data Spare = Spare Int Int
    deriving (Eq, Show)

instance Arbitrary Throw where
    arbitrary = do
        e <- elements [0..10]
        return $ Throw e

instance Arbitrary Spare where
    arbitrary = do
        t <- elements [0..9]
        return $ Spare t (10-t)

prop_NormalGameEqualSumOfThrows game = score throws == sum throws
    where throws = take 20 $ concat $ map (\(Normal t u) -> [t,u]) game

main = hspec $ do
    describe "a test throw" $ do
        it "is always comprised in [0..10]" $ property $ do
            \(Throw t) -> t `elem` [0..10]

    describe "a test spare" $ do
        it "include a first throw that is not 10 and " $ property $ do
            \(Spare t u) -> t < 10

        it "has two throws making a sum of 10" $ property $ do
            \(Spare t u) -> t + u == 10

    describe "score" $ do
        describe "computes a bowling score" $ do
            describe "for poor performance players" $ do
                it "returns the sum of the throws" $ property $ do
                    prop_NormalGameEqualSumOfThrows

            describe "for medium players doing spares" $ do
                it "adds the following throw to the score" $ property $ do
                   \(Spare t u) (Throw v) -> score [t,u,v] == t + u + v + v  
                it "adds the rest of the throws to the score" $ property $ do
                    \(Spare t u) (Normal v w) -> score [t,u,v,w] == t+u+v+v+w

            describe "for excellent players doing strikes" $ do
                it "adds the two next throws as bonuses" $  property $ do
                    \(Strike t) (Normal u v) -> score [t,u,v] == t+u+v+u+v 

                it "doesn't count a strike on spare made with 0 and 10" $ property $ do
                    \(Normal t u) -> score [0,10,t,u] == 10+t+t+u

            describe "for excellent players having bonuses in end game" $ do
                it "add bonuses but not throws" $ property $ do
                    \(Spare t u) -> score ((replicate 18 0) ++ [t,u,5]) == t+u+5

                it "add only bonus throws at the end of an all 5 game" $ do
                    score (replicate 21 5)  `shouldBe`  150
