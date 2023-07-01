import Test.Hspec
import Data.List
import Data.Ord
import Card
import Hand

s = map suit (cards "Kh As Kd Ac") 
r = map rank (cards "2h 3h 4h 5h 6h 7h 8h 9h Th Jh Qh Kh Ah")

isOrdered (x:y:xs) = x < y && isOrdered (y:xs)
isOrdered _ = True
 
h `shouldBeat` g = comparing ranking h g  `shouldBe` GT

main = hspec $ do
    describe "cards" $ do
        it "should represent distinct poker cards" $ do
            nub s `shouldBe` s
            nub r `shouldBe` r
            isOrdered r `shouldBe` True 

    describe "ranking" $ do
        it "gives the ranking value of a hand" $ do
            let h = cards "7s 3s 4s 5c 2c" 
            let g = cards "2s 3s 4s 5c 8c" 
            g `shouldBeat` h 


        it "gives correct ranking values for groups of card" $ do
            let h = cards "As Ks Qs Jc 9c"
            let g = cards "2s 2d 3s 4s 5s"
            g `shouldBeat` h 

            let h = cards "2s 2d 3s 4s 5s"
            let g = cards "2s 2d 3s 4s 6s"
            g `shouldBeat` h 

            let h = cards "2s 2d As Ks Qs"
            let g = cards "3s 3d 5s 4s 6s"
            g `shouldBeat` h 


            let h = cards "As Ac Kd Qd Js"
            let g = cards "4s 2s 2c 3s 3c"
            g `shouldBeat` h
            

            let h = cards "4s 2c 2d 3d 3s"
            let g = cards "4s 2s 2c 4s 5c"
            g `shouldBeat` h

            let h = cards "As Ac Kd Kd Qs"
            let g = cards "2h 2s 2c 3s 4c"
            g `shouldBeat` h

            let h = cards "As Ac Ad Kd Qd"
            let g = cards "2s 3s 4d 5h 6h"
            let f = cards "3s 4d 5h 6h 7h"
            let i = cards "5s 4d 3h 2h Ah"
            i `shouldBeat` h
            g `shouldBeat` i
            g `shouldBeat` h
            f `shouldBeat` g


            let h= cards "As Ks Qs Js Tc"
            let g= cards "2s 3s 4s 5s 7s"
            g `shouldBeat` h

            let h= cards "As Ks Qs Js 9s"
            let g= cards "2s 2c 2d 3s 3h"
            g `shouldBeat` h

            let h= cards "As Ah Ad Ks Kc"
            let g= cards "2s 2c 2d 2h 3h"
            g `shouldBeat` h

            let h= cards "As Ah Ad Ac Kc"
            let g= cards "5s 4s 3s 2s As"
            g `shouldBeat` h

            let h= cards "As Ks Qs Js Ts"
            fst (ranking h) `shouldBe` RoyalFlush


