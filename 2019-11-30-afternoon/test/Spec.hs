import Test.Hspec
import Parser (normal)

main = hspec 
  (describe "a polish calculator parser" 
    (it "parses simple expressions" 
      (do 
          normal "42" `shouldBe` "42"
          normal "-42" `shouldBe` "-42"
          normal "--42" `shouldBe` "42"
          normal "-3 4" `shouldBe` "-1"
          normal "*+42 17 !5" `shouldBe` "7080"
      ) 
    )
  )
