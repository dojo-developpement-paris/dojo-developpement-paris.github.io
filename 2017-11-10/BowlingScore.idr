import Data.Vect
import Data.So
shouldBe : (Eq a,Show a) => (given : a) -> (expected : a) -> IO ()
shouldBe g e = if g == e
    then putStrLn "Test Passed"
    else putStrLn ("Expected " ++ show e ++ " but got " ++ show g)

it : String -> IO () -> IO ()
it s t = do 
    putStrLn s 
    t

spare : Nat
spare = the Nat 10 

score : Vect n Nat  -> Nat
score [] = 0
score [x] = x 
score (x :: (y :: [])) = x + y
score (x :: (y :: (z :: xs)))  with (x + y) 
    | spare = x + y + z + score (z :: xs)
    | _  = x + y + score (z :: xs)

main : IO ()
main = do
    it "should start at 0" $ score [] `shouldBe` 0
    it "should sum throws" $ do
        score [3] `shouldBe` 3
        score [1] `shouldBe` 1
        score [1,1] `shouldBe` 2
    it "should handle spares" $ do
        score [9,1,1] `shouldBe` 12
        score [9,1,2] `shouldBe` 14


