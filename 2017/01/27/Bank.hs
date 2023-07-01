module Bank
where

type Amount = Integer
type Message = String
type Operation = String

data Account = Account Amount [Operation]
    deriving (Eq, Show)


account :: Amount -> Either Message Account
account n= Right $ Account n []

balance :: Account -> Amount
balance (Account b _) = b

nonNegative :: (Amount -> Amount -> Amount) -> Message -> Amount -> Account -> Either Message Account
nonNegative op m x (Account b ops) | x < 0     = Left $ "negative " ++ m ++ " not allowed"
                                   | otherwise = Right $ Account (b `op` x) $ ops ++ [m ++ " " ++ show x]

deposit :: Amount -> Account -> Either Message Account
deposit = nonNegative (+) "deposit" 

withdraw :: Amount -> Account -> Either Message Account
withdraw = nonNegative (-) "withdrawal" 

statement :: Account -> [Operation]
statement (Account _ ops) = ops
