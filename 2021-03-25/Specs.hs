import Test.Hspec


type Digit = [String]

axis :: Digit
axis = [" "
         ,"|"
         ,"|"
         ,"|"]

digit1 :: Digit
digit1= ["_"
        ," "
        ," "
        ," "]

digit3 :: Digit
digit3 = [" " ,"\\" ," " ," "]

merge :: Digit -> Digit -> Digit
merge = zipWith (++)

mirror :: Digit -> Digit
mirror = map symmetry

cistercian :: Int -> Digit
cistercian x = mergeOf x axis (digitOf x)

mergeOf x | x < 10 = merge
mergeOf x = flip (mergeOf (x `div` 10))

digitOf :: Int -> Digit
digitOf 1 = digit1
digitOf 3 = digit3
digitOf x | x `mod` 1000 == 0 = mirror (digitOf (x `div` 10))
digitOf x | x `mod` 100 == 0 = vertical_symmetry (digitOf (x `div` 100))
digitOf x = mirror (digitOf (x `div` 10))


symmetry :: String -> String
symmetry "\\" = "/"
symmetry "/" = "\\"
symmetry x = x

vertical_symmetry :: Digit -> Digit
vertical_symmetry x | x == digit3 = [" "," "," ","/"] 
                    | otherwise   = reverse x

main = hspec $ do
    describe "cistercian" $ do
        describe "translate arabic numbers to cistercian numbers" $ do
            it "starting with 1" $ do
                cistercian 1 `shouldBe` [" _"
                                        ,"| "
                                        ,"| "
                                        ,"| "]

            it "and also 10" $ do 
                cistercian 10 `shouldBe` ["_ "
                                         ," |"
                                         ," |"
                                         ," |"]

            it "and also 100" $ do
                cistercian 100 `shouldBe` ["  "
                                          ,"| "
                                          ,"| "
                                          ,"|_"]

            it "and also 1000" $ do
                cistercian 1000 `shouldBe` ["  "
                                           ," |"
                                           ," |"
                                           ,"_|"]

            it "what about 3" $ do
                cistercian 3 `shouldBe`   ["  "
                                          ,"|\\"
                                          ,"| "
                                          ,"| "]
                
            it "and what about 30" $ do
                cistercian 30 `shouldBe`  ["  "
                                          ,"/|"
                                          ," |"
                                          ," |"]
            it "and also 300" $ do
                cistercian 300 `shouldBe` ["  "
                                          ,"| "
                                          ,"| "
                                          ,"|/"]

            it "and also 3000" $ do
                cistercian 3000 `shouldBe` ["  "
                                           ," |"
                                           ," |"
                                           ,"\\|"]
