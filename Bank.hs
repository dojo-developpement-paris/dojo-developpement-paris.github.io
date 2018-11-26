module Bank where

bank :: (Monad m) => (String -> m ()) -> m ()
bank out = out report
    where report = unlines 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        ,"Solde : 0"
                        ]
