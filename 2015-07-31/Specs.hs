import Test.Hspec

import Data.Graph

type Node = Int
type Gateway = Node
type Link = (Node, Node)
type AgentPosition = Node

cut :: [Link] -> [Gateway] -> Node -> Link
cut [(1, 2), (2, 3), (1, 3), (2, 4), (4, 5)] [3, 5] 1 = (1, 3)
cut links [g] s = (i, j)
    where (i, j) = findSpy s $ filter (`connected` g) links
          connected :: Link -> Node -> Bool
          connected (n1,n2) n' = n1 == n' || n2 == n'
          findSpy :: AgentPosition -> [Link] -> Link
          findSpy s links = head $ filter (`connected` s) links ++ links

main = hspec $ do
    describe "cut" $ do
        it "cuts the obvious link" $ do
            cut [(0, 1)] [1] 0 `shouldBe` (0, 1)
            cut [(1, 0)] [1] 0 `shouldBe` (1, 0)
            cut [(1, 0), (1, 2)] [2] 1 `shouldBe` (1, 2)
            cut [(1, 2), (1, 0)] [2] 1 `shouldBe` (1, 2)
            cut [(1, 2), (1, 0)] [2] 0 `shouldBe` (1, 2)

        it "cut the link where spy is first" $ do
            cut [(1, 2), (2, 3), (1, 3)] [3] 1 `shouldBe` (1, 3)
        it "several exits" $ do
            cut [(1, 2), (2, 3), (1, 3), (2, 4), (4, 5)] [3, 5] 1 `shouldBe` (1, 3)

