import System.Console.ANSI
import Control.Concurrent
import Test.Hspec (hspec, describe, it, shouldBe)

example1 = [Object Unknown (1,0)]
example2 = [Object Visible (1,0)]

type Image = String
type Animation = [Image]

type AsteroidBelt = Map

type X = Int
type Y = Int
data Object = Object Asteroid (X, Y)
    deriving (Show, Eq)
data Asteroid = Visible | Occluded | Unknown
    deriving (Show, Eq)

type Map = [Object]

display :: Image -> IO ()
display scene = do
    setSGR [SetColor Foreground Dull Blue]
    clearScreen
    setCursorPosition 0 0
    putStrLn scene
    threadDelay 400000

showBelt :: AsteroidBelt -> Image
showBelt [Object Unknown (1,0)] = ".#"
showBelt [Object Visible (1,0)] = ".v"

reMapFrom :: (X, Y) -> Map -> Map
reMapFrom _ _ = [Object Visible (1, 0)]

main :: IO ()
main = do
    hspec $ do
        describe "Station at 0,0 and in 1,0 there's an asteroid" $ do
            it "Station should see asteroid" $ do
                reMapFrom (0, 0) [Object Unknown (1,0)] `shouldBe` [Object Visible (1, 0)]

    mapM_ (display . showBelt) [example1, example2]
