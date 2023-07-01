import Test.Hspec
import Card

ordered :: Ord a => [a] -> Bool
ordered [] = True
ordered [_] = True
ordered (n:ns) = (n < head ns) && ordered ns


beats s t = compare (hand (cards s)) (hand (cards t))

shouldBeat s t = s `beats` t `shouldBe` GT

main = hspec $ do 
    describe "a card" $ do
        it "should compare by rank" $ do
            ordered (map rank $ cards "2s 3s 4s 5s 6s 7s 8s 9s Ts Js Qs Ks As") `shouldBe`True
            compare (rank (card "Ks")) (rank (card "Kd")) `shouldBe` EQ 
            compare (rank (card "Ks")) (rank (card "As")) `shouldBe` LT 


        it "should be different from another with same rank" $ do
            card "Ks" /= card "Kh" `shouldBe` True  

    describe "a Highcard" $ do
        it "should compare with anoher highcard" $ do
             "Qs 8d 6d 5c As" `shouldBeat` "Ks Qs 8d 6d 5c" 

    describe "a pair" $ do
        it "the lowest pair should be greater than the highest HighCard" $ do
            "2s 2c 3d 5d 6h" `shouldBeat` "As Ks Qd Jd 9h" 
            "3s 4c 4d 5d 6h" `shouldBeat` "As Ks Qd Jd 9h" 

        it "should compare pairs" $ do
            "3s 4d 5s 6h 3d" `shouldBeat` "2s 2c 3d 5d 6h"
