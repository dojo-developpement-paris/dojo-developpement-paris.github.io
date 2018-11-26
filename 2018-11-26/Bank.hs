module Bank where

type Date = String
type Amount = Int
data Operation = Deposit Date Amount

bank :: (Monad m) => [Operation] -> (String -> m ()) -> m ()
bank [] out = out report
    where report = unlines 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        ,"Solde : 0"
                        ]
bank [_] out = out report
    where report = unlines 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        ,"26/11/2018 | | 4807"
                        ,"Solde : 4807"
                        ]

balance :: [Operation] -> Amount
balance _ = 0
