import Test.Hspec

data Trie = Nil
          | Node Char [Trie]
          | TerminalNode Char [Trie] 
    deriving (Eq, Show) 

trie :: String -> Trie
trie "" = Nil
trie [c] = TerminalNode c []
trie (c:cs) = Node c [trie cs] 

merge :: Trie -> Trie -> Trie
merge Nil t = t
merge t Nil = t
merge t1 t2 | t1 == t2 = t1
merge (TerminalNode c []) (Node c' t)  = TerminalNode c t 
merge (Node c' t) (TerminalNode c [])  = TerminalNode c t 

main = hspec $ do
    describe "trie" $ do
        it "should convert a String to a Trie" $ do 
            trie "" `shouldBe` Nil
            trie "a" `shouldBe` TerminalNode 'a' []
            trie "at" `shouldBe` Node 'a' [TerminalNode 't'[]]
    describe "merge" $ do
        it "should merge a Trie with another Trie" $ do
            merge Nil Nil `shouldBe` Nil
            merge Nil (trie "a") `shouldBe` trie "a"
            merge (trie "a") Nil `shouldBe` trie "a"
            merge (trie "a") (trie "a") `shouldBe` trie "a"
            merge (trie "a") (trie "at") `shouldBe` TerminalNode 'a' [trie "t"] 
            merge (trie "i") (trie "if") `shouldBe` TerminalNode 'i' [trie "f"] 
            merge (trie "if") (trie "i") `shouldBe` TerminalNode 'i' [trie "f"] 
