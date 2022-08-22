import Test.Hspec
import Bilbo hiding (main)

main = hspec $ do
	describe "bilbo" $ do 
		it "should manage one letter word" $ do
			bilbo " " `shouldBe` "."
			bilbo "A" `shouldBe` "+."
			bilbo "B" `shouldBe` "++."
			bilbo "Z" `shouldBe` "-."
			bilbo "Y" `shouldBe` "--."
		it "should manage two letter word" $ do
			bilbo "  " `shouldBe` ".."
			bilbo " A" `shouldBe` ".+."
			bilbo "AB" `shouldBe` "+.+."
			bilbo "AA" `shouldBe` "+.."
	describe "distance" $ do
		it "should compute distance" $ do
			distance ' ' 'A' `shouldBe` 1
			distance 'Z' ' ' `shouldBe` 1
			distance 'A' ' ' `shouldBe` 26
