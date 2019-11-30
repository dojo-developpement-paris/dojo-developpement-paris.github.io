import Test.Hspec
import Parser (prefix)

main = hspec 
  (describe "a polish calculator parser" 
    (it "parses simple expressions" 
      (do 
          prefix "42" `shouldBe` "42"
          prefix "-42" `shouldBe` "-42"
          prefix "--42" `shouldBe` "42"
          prefix "-3 4" `shouldBe` "-1"
          prefix "*+42 17 !5" `shouldBe` "7080"
      ) 
    )
  )
