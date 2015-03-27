import Test.QuickCheck
import Lags

main = do quickCheck greaterThanZero

arbitraryOrder :: Gen Order
arbitraryOrder = do
    s <- elements [0..10]
    d <- elements [1..10]
    p <- elements [1..1000]
    return (s,d,p)

arbitraryList :: Gen [Order]
arbitraryList = do
    n <- elements [1..10]
    sequence $ replicate n arbitraryOrder

oracle = value

greaterThanZero :: [Order] -> Gen Prop
greaterThanZero os = forAll arbitraryList $ \os -> profit os == oracle os

