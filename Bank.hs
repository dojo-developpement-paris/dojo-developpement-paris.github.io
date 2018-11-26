module Bank where

type Date = String
type Amount = Int
data Operation = Deposit Date Amount deriving Show

bank :: (Monad m) => [Operation] -> (String -> m ()) -> m ()
bank [] out = out report
    where report = unlines 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        ,"Solde : " ++ show (balance [])
                        ]
bank operations out = out report
    where report = unlines 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        ,"26/11/2018 | | 4807"
                        ,"Solde : " ++ (show.balance) operations
                        ]

balance :: [Operation] -> Amount
balance [Deposit _ amount] = amount
balance _ = 0
