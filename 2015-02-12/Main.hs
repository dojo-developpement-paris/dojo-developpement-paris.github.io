module Main
where
import Test.Hspec
import Scrabble


main :: IO()
main = hspec $ do
	describe "test 0" $ do
		it "should fail" $ do
			2 + 2 `shouldBe` 4
	describe "bestWord" $ do
		it "should return A as the best word when we have a hand with only the letter A" $ do
			bestWord "A" `shouldBe` Just "A"

		it "should return I as the best word when we have a hand with only the letter I" $ do
			bestWord "I" `shouldBe` Just "I"

		it "should return Nothing if hand has only a B" $ do
			bestWord "B" `shouldBe` Nothing

		it "should return Nothing if hand has only a C" $ do
			bestWord "C" `shouldBe` Nothing

		it "should return AS as the best word when we have a hand with only the letters A,S" $ do
			bestWord "AS" `shouldBe` Just "AS"

		it "should return AS as the best word when we have a hand with only the letters S,A" $ do
			bestWord "SA" `shouldBe` Just "AS"

		it "should return A as the best word when we have a hand with only the letters X,A" $ do
			bestWord "XA" `shouldBe` Just "A"

