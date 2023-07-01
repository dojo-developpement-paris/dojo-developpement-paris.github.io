import Test.Hspec
import Control.Arrow

main = hspec $ do
  describe "Auto Insurance bonus calculation" $ do
    describe "Positive bonus evolutions" $ do
      it "Bonus starts at 100" $ do
        bonus New `shouldBe` B 100
      it "decreases by 5 percent every year" $ do
        bonus (year 1) `shouldBe` B 95
        bonus (year 4) `shouldBe` B 80
        bonus (year 5) `shouldBe` B 76
      it "cannot go under 50" $ do
        bonus (year 12) `shouldBe` B 51
        bonus (year 13) `shouldBe` B 50
        bonus (year 50) `shouldBe` B 50
      it "yearly bonuses are skipped after an accident" $ do
        bonus (Year (A Liable New)) `shouldBe` B 125
        bonus (Year (A Liable(year 13))) `shouldBe` B 62
    describe "negative bonus evolutions" $ do
      it "increases by 25% for a liable accident" $ do
        bonus (A Liable New)      `shouldBe` B 125
        bonus (A Liable (year 4)) `shouldBe` B 100
      it "multiple penalties are multiplicative" $ do
        bonus (A Liable (A Liable New)) `shouldBe` B 156
      it "increases by 12.5% when liability is split" $ do
        bonus (A Split New)      `shouldBe` B 112
        bonus (A Split (year 4)) `shouldBe` B 90
      it "Bonus cannot be above 350" $ do
        bonus (accidents 5) `shouldBe` B 303
        bonus (accidents 6) `shouldBe` B 350
        bonus (accidents 25) `shouldBe` B 350
    describe "special events" $ do
      it "after 2 years without accidents, max bonus is 200" $ do
        bonus (yearSince 2 (Year (accidents 10))) `shouldBe` B 100
      it "after 3 years having 50% bonus, the next accident is ignored" $ do
        bonus (A Liable (yearSince 3 (year 13))) `shouldBe` B 50
        
--------Test data constructors---------
accidents 0 = New
accidents n = A Liable (accidents (n-1))
year 0 = New
year n = Year (year (n-1))
yearSince 0 root = root
yearSince n root = Year (yearSince (n-1) root)
----------------Test end---------------

newtype Bonus = B Integer
  deriving (Eq, Show)

data AccidentType = Liable    --You are responsible for the accident
                  | Split     --The accident responsibility is split 

data History = New 
             | Year History                   --Year anniversary
             | A AccidentType History         --accident event

bonus :: History -> Bonus
bonus New                 = B 100
bonus (A _ (Year(Year(Year(b))))) | bonus b == B 50 = bonus b
bonus (Year y@(Year (Year rest))) = B (min 100 current)    --Still not happy...
  where (B current)  = bounded (apply 0.95 (bonus y)) -- ...about code dup
bonus (Year rest) = case rest of
  (A _ _) -> bonus rest
  _       -> bounded (apply 0.95 (bonus rest))
bonus (A liability rest) = bounded (apply penalty (bonus rest))
  where penalty = case liability of 
                Liable -> 1.25
                Split  -> 1.125

bounded :: Bonus -> Bonus
bounded b@(B n) | n < 50    = B 50
                | n > 350   = B 350
                | otherwise = b

apply factor (B coef) = B (make factor coef)
make factor = fromInteger >>> (* factor) >>> truncate

