import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

main = hspec $ do
    describe "the canary" $ do
        prop "it quacks" $ \x -> x == (x :: Int) 
    describe "the dog" $ do
        prop "it barks" $ \dog -> (read . show) dog == (dog :: String)
    describe "the cat" $ do
        prop "it meows" $ \cat -> (read . show) cat == (cat :: Double)
    
    describe "A function that checks Dijkstra property on a chain" $ do
        prop "it works for two pearls" 
            $ forAll (necklace 2) $ \s@(x:y:[]) -> dijkstra s == (x /= y)
        prop "it works for three pearls" 
            $ forAll (necklace 3) $ \s@[x,y,z] -> dijkstra s == (x /= y && y /= z)
        it "works for four pearls" $ property
            $ forAll (necklace 4) $ \s@[w,x,y,z] -> dijkstra s == (x /= y
                                                             &&  y /= z
                                                             &&  w /= x
                                                             &&  [w,x] /= [y,z])

necklace :: Int -> Gen [Pearl]
necklace = vector

data Pearl = A | B | C
    deriving (Eq, Show, Enum)

instance Arbitrary Pearl where
    arbitrary = fmap toEnum $ choose (0, 2)

dijkstra :: (Eq a) => [a] -> Bool
dijkstra [l,r] = l /= r
dijkstra [a,b,c,d] = dijkstra [a,b,c] && dijkstra [c,d]
                    && dijkstra [[a, b], [c, d]]
dijkstra (x:y:rest) = dijkstra [x,y] && dijkstra (y:rest)
