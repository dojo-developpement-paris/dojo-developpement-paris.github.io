import Test.Hspec
import Test.QuickCheck
import Diamond (diamond,index)

diamondIsSymetrical :: Char -> Property
diamondIsSymetrical c = (index c > 0) ==> 
    diamond c == (unlines.reverse.lines) (diamond c)


main = do 
    hspec $ do
        describe "diamond" $ do
            it "should say A when given A" $ do
                diamond 'A' `shouldBe` "A\n"

            it "should say\n A\nB B\n A\nwhen given B" $ do
                diamond 'B' `shouldBe` (unlines [" A","B B"," A"])
                
            it "should say\n  A\n B B\nC   C\n B B\n  A\nwhen given C" $ do
                diamond 'C' `shouldBe` (unlines ["  A"
                                                ," B B"
                                                ,"C   C"
                                                ," B B"
                                                ,"  A"])
    quickCheck diamondIsSymetrical


