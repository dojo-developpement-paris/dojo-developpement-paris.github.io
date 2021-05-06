import Test.Hspec

main = hspec $ do
  describe "the bonus for car insurances" $ do
    it "starts at 100%" $
      bonus NewDriver `shouldBe` Bonus 100
    it "a new driver gets to 95 bonus after one year without accident" $
      bonus (Anniversary NewDriver) `shouldBe` Bonus 95
    it "a new driver gets to 90 bonus after two years without accident" $
      bonus (Anniversary(Anniversary NewDriver)) `shouldBe` Bonus 90
    it "rounding rules" $
      bonus (years 5 NewDriver) `shouldBe` Bonus 76
    it "bonus can't go below 50" $ 
      bonus (years 13 NewDriver) `shouldBe` Bonus 50
    describe "accidents :(" $ do
      it "a new driver gets to 125 bonus after one accident" $ do
        bonus (Accident NewDriver) `shouldBe` Bonus 125
        bonus (accidents 2 NewDriver) `shouldBe` Bonus 156
      it "drivers with an accident in the year don't get a bonus" $ do
        bonus (Anniversary (Accident NewDriver)) `shouldBe` Bonus 125
    it "after 3 years at bonus 50, the first accident is ignored!" $ do
      bonus (Accident (years 3 (years 13 NewDriver))) `shouldBe` Bonus 50
      bonus (Accident (years 5 (years 13 NewDriver))) `shouldBe` Bonus 50
      bonus (Accident (years 3 (Accident (years 50 NewDriver)))) `shouldBe` Bonus 62
      bonus (Accident (years 4 (Accident (years 50 NewDriver)))) `shouldBe` Bonus 50


accidents 0 events = events
accidents n events = accidents (n - 1) (Accident events)

years 0 events = events
years n events = years (n - 1) (Anniversary events)

data EventList
  = Anniversary EventList
  | NewDriver
  | Accident EventList

newtype Bonus = Bonus Int
  deriving (Show, Eq)

bonus :: EventList -> Bonus

bonus NewDriver = Bonus 100

bonus (Accident (Anniversary (Anniversary (Anniversary rest@(Anniversary _)))))
  | bonus rest == Bonus 50 = Bonus 50

bonus (Accident eventList) = Bonus ((rest * 125) `div` 100)
  where Bonus rest = bonus eventList

bonus (Anniversary rest@(Accident _)) = bonus rest

bonus (Anniversary restofthelist) = Bonus (max 50 uncappedBonus)
  where 
    uncappedBonus = (rest * 95) `div` 100
    Bonus rest = bonus restofthelist
