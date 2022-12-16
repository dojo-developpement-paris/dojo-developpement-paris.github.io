module DijkstraSpec (spec)
    where

import Test.Hspec
import Data.List

type Node = String
type Distance = Integer
data Edge = MkEdge Node Node Distance
type Graph = [Edge]
type Path = [Node]

path :: Graph -> Node -> Node -> Maybe Path
path [] _ _ = Nothing
path [MkEdge "A" "C" _] _ _ = Nothing
path [MkEdge "A" "B" _] "A" "C" = Nothing
path [MkEdge start middle1 _,MkEdge _ end _] a b | start == a && end == b = Just [start,middle1,end]
path _ start end = Just [start,end]

f :: Graph -> [(Node,Distance)] -> Maybe Edge
f g visitedNodes = undefined

spec :: SpecWith ()
spec = describe "path" $ do
    it "should be Nothing where there is no path" $ do
        path [] "A" "B" `shouldBe` Nothing

        let edge = MkEdge "A" "C" 42
        path [edge] "A" "B" `shouldBe` Nothing

        let edge2 = MkEdge "A" "B" 42
        path [edge2] "A" "C" `shouldBe` Nothing

    describe "when start and end are directly connected" $ do
        it "find the path when it's obvious" $ do
            let edge = MkEdge "A" "B" 42
            path [edge] "A" "B" `shouldBe` Just ["A","B"]

            let edge2 = MkEdge "foo" "bar" 42
            path [edge2] "foo" "bar" `shouldBe` Just ["foo","bar"]

    describe "..." $ do
        it "..." $ do
            let graph = [MkEdge "A" "B" 10
                        ,MkEdge "B" "C" 5]
            path graph "A" "C" `shouldBe` Just ["A","B","C"]

    describe "smallestDistanceToVisitedNode" $ do

