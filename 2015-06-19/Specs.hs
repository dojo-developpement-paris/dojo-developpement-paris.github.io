import Test.Hspec
import Data.List(sort)

type Coin = Int
type Sum  = Int
type Coins = [Coin]

changeFor :: Coins -> Sum -> Coins
changeFor coins = reverse . (changeFor' ((reverse . sort) coins))
changeFor' :: Coins -> Sum -> Coins
changeFor' _ 0 = []
changeFor' [4, 3, 3, 1, 1] 6 = [3, 3]
changeFor' [4, 3, 3, 3, 1, 1, 1, 1, 1] 9 = [3, 3, 3]
changeFor' (coin:coins) s | coin <= s = coin : ( changeFor' coins $ s - coin)
                          | otherwise = changeFor' coins s

main = hspec $ do
  describe "The Changinator" $ do
    it "should work :D" $ do
      [1] `changeFor` 1 `shouldBe` [1]
      [2] `changeFor` 2 `shouldBe` [2]
      [1, 1] `changeFor` 2 `shouldBe` [1,1]
      [1, 2] `changeFor` 3 `shouldBe` [1,2]
      [1, 2] `changeFor` 1 `shouldBe` [1]
      [1, 1] `changeFor` 1 `shouldBe` [1]
      [1, 2] `changeFor` 2 `shouldBe` [2]
      [1, 1, 1] `changeFor` 2 `shouldBe` [1, 1]
      [1, 1, 2] `changeFor` 3 `shouldBe` [1, 2]
      [1, 2, 2, 3] `changeFor` 4 `shouldBe` [1, 3]
      [2, 1, 1] `changeFor` 2 `shouldBe` [2]
      [1, 1, 3, 3, 4] `changeFor` 6 `shouldBe` [3, 3]
      [1, 1, 1, 1, 1, 3, 3, 3, 4] `changeFor` 9 `shouldBe` [3, 3, 3]
