{-# LANGUAGE OverloadedStrings #-}
import Test.Hspec
import Test.Hspec.Wai
import Web.Spock hiding (get, post)
import Server (server)

main :: IO ()
main = hspec $ do 
  describe "the server" $ do
    with (spockAsApp server) $ do
      it "is empty at /" $
        get "/" `shouldRespondWith` ""{matchStatus=200}
      describe "get" $ do
        describe "serves help message" $ do
          it "when called with help" $
            get "/help" `shouldRespondWith` "actually helpless"{matchStatus=200}
        describe "serves key-values" $ do
          it "can't find a value to serve if key wasn't provided first" $
            get "/values/key" `shouldRespondWith`
              "unknown: key"{matchStatus=404}
          it "returns a value for an existing key" $
            get "/values/toto" `shouldRespondWith`
              "tutu"{matchStatus=200}
      describe "post" $ do
        it "works well :)" $ do
          post "/values/actualKey" "\"actualValue\"" `shouldRespondWith`
            "Stored!"{matchStatus=200}
