module Hello where

type Name = Maybe String

hello :: Name -> String
hello (Just name) = "Hello " ++ name
hello Nothing = hello (Just "world")
