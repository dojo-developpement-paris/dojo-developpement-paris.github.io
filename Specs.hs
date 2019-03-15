import Test.Hspec (hspec, describe, it)
import Test.QuickCheck (forAll, choose)
import Diamond (diamond)

main = hspec $ do
    describe "a diamond" $ do
        let letter = choose ('A','Z')

        it "is not empty" $ forAll letter $ 
            not . null . concat . diamond

        it "contains a diagonal made of letters" $ 
            forAll letter $ \l ->
                let ls = ['A'..l]
                    n  = length ls
                    d  = diamond l
                    ul = (map (take n).(take n)) d
                    m  = n - 1
                    diag r c | c == (m-r) = ul!!r!!c == ls!!r
                             | otherwise  = ul!!r!!c == ' '
                in and [diag r c | r <- [0..m], c <- [0..m]]
            
        it "is symmetric horizontally" $ do
            forAll letter $ \l->
                diamond l== reverse (diamond l)

        it "is symmetric vertically" $ do
            forAll letter $ \l->
                diamond l== map reverse (diamond l)

        it "has an odd height and width" $ do
            forAll letter $ \l->
                odd (length (diamond l))  
                && odd (maximum (map length (diamond l)))

        it "has an height = width = N*2-1" $ do
            forAll letter $ \l->
                let height = length (diamond l)
                    width  = sum (map length (diamond l)) `div` height
                in height == width
                && height == length ['A'..l] * 2 - 1
