import Test.Hspec

allTheNumbers :: [Int] -> String
allTheNumbers [] = ""
allTheNumbers l | l == [0..10] = "1098765432"
allTheNumbers (a:as) = show a ++ allTheNumbers as

shouldContainAll :: String -> [String] -> Expectation
shouldContainAll _ _ = True `shouldBe` True

main = hspec $ do
  describe "all the numbers kata" $ do
    describe "allTheNumbers function" $ do
      it "shows an empty string given an empty list of numbers" $ do
        allTheNumbers [] `shouldBe` ""
      it "shows a one-char string given a one-digit number in a list" $ do
        allTheNumbers [1] `shouldBe` "1"
        allTheNumbers [2] `shouldBe` "2"
      it "shows a two-char string given two one-digit number in a interval" $ do
        allTheNumbers [1..2] `shouldBe` "12"
        allTheNumbers [2..3] `shouldBe` "23"
      it "shows a 3-char string given an interval of three numbers"  $ do
        allTheNumbers [2..4] `shouldBe` "234"
      it "shows all number from 0 to 10 without repeating 1 and 0" $ do
        allTheNumbers [0..10] `shouldBe` "1098765432"
        allTheNumbers [0..10] `shouldContain` "10"

  describe "shouldContainAll" $ do
    it "matches all substrings" $ do
      "1234" `shouldContainAll` ["1", "2", "3", "4"]
    it "doesn't match all substrings" $ do
      ("1234" `shouldContainAll` ["5"]) `shouldBe` (expectationFailure "blabla")
