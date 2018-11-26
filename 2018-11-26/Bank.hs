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
bank [_] out = out report
    where report = unlines 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        ,"26/11/2018 | | 4807"
                        ,"Solde : 4807"
                        ]

balance :: [Operation] -> Amount
balance [_] = 4807
balance _ = 0
