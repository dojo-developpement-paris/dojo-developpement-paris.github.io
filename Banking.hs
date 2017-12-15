module Banking where

process :: Monad m => (m String) -> (String -> m ()) -> m  ()
process inp out = out "0" 
