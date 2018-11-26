module Bank where

bank :: (Monad m) => (String -> m ()) -> m ()
bank out = out "4807"
