import Test.Hspec
import ShortestPath
import Data.PSQueue


data City = A | B | C | D | E deriving (Eq,Ord,Show)

main = hspec $ do
    let g = [(A,[(B,3),(C,7)])
            ,(B,[(A,3),(C,2)])
            ,(C,[(A,7),(B,2),(D,1)])
            ,(D,[(C,1)])]
    describe "a graph" $ do
        it "allows for searching adjacent nodes to a node" $ do
            adjacentNodes A g  `shouldBe` [(B,3),(C,7)]
            adjacentNodes C g  `shouldBe` [(A,7),(B,2),(D,1)]

    describe "a list of distances" $ do
        it "allows for tracing a route" $ do
        let ds = [(A,(0,Nothing)),(B,(3,Just A)),(C,(5,Just B)),(D,(6,Just C))]
        pathTo D ds  `shouldBe` [(0,A),(3,B),(5,C),(6,D)]

    describe "a distance queue" $ do
        it "is intialized with infinite distances except for origin node" $ do
            toList (initialDistances A g) `shouldBe` [A :-> (0,Nothing)
                                                     ,B :-> (10000, Nothing)
                                                     ,C :-> (10000, Nothing)
                                                     ,D :-> (10000, Nothing)]

        it "is updated with next Distance" $ do
            let g = [(A,[(B,3)])
                    ,(B,[(A,3),(C,2)])
                    ,(C,[(B,2)])]
            let t = (initialDistances A g, [])
                (q,l) = nextDistance g t
            l `shouldBe` [(A,(0,Nothing))]
            toList q `shouldBe` [B :-> (3, Just A)
                                ,C :-> (10000, Nothing)]
 
        
        it "is updated with next Distances" $ do
            let t = (initialDistances A g, [])
                (q,l) = nextDistance g t
            l `shouldBe` [(A,(0,Nothing))]
            toList q `shouldBe` [B :-> (3, Just A)
                                ,C :-> (7, Just A)
                                ,D :-> (10000,Nothing)]

        it "is updated with next Distances if shorter" $ do
            let g = [(A,[(B,3),(C,4)])
                    ,(B,[(A,3),(C,2)])
                    ,(C,[(A,4),(B,2),(D,1)])
                    ,(D,[(C,1)])]
                (q,_) = nextDistance g (nextDistance g (initialDistances A g, []))
            toList q `shouldBe` [C :-> (4, Just A)
                                ,D :-> (10000,Nothing)]

        it "allows for computing all distances" $ do
            let (q,l) = allDistances A g
            toList q `shouldBe` []
            l  `shouldBe` [(D,(6,Just C)),(C,(5,Just B)),(B,(3,Just A)),(A,(0,Nothing))]

    describe "shortest path" $ do
        it "finds the shortest path from a to z" $ do
            shortestPath A D g  `shouldBe` [(0,A),(3,B),(5,C),(6,D)]
        

    

