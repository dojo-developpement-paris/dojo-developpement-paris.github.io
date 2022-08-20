module Banking where

type Client = String
type Message = String
type Amount = Int
data Order = Balance Client
           | Deposit Client Amount
           | Error String
    deriving (Eq,Show,Read)
type BankState = ([Message],[(Client,Amount)])

process :: Monad m => (m String) -> (String -> m ()) -> m  ()
process inp out = do
    lines <- inp 
    out $ execute $ interpret $ lines

interpret:: String -> [Order]
interpret input = fmap (interpret'.words) $ lines input 
interpret' ["deposit",client,n] = case (readInt n) of
                                                    [amount] -> Deposit client amount
                                                    []       -> Error n
interpret' ["balance", "Smith"]  = Balance "Smith"

execute :: [Order] -> Message
execute orders = unlines $ fst $ foldr execute' ([],[]) $ reverse orders 
    where   
        execute' :: Order -> BankState -> BankState
        execute' (Deposit client amount) state = deposit client amount state


        execute' (Balance client) state  = balance client state
        execute' (Error input)    state  = message ("sorry did not understand " ++ input) state 

deposit :: Client -> Amount -> BankState -> BankState
deposit client amount (messages,accounts) = case lookup client accounts of
    Just balance -> (messages ++ ["balance is now " ++ show balance'],(client,balance'):accounts)
        where balance' = balance + amount
    Nothing      -> (messages ++ ["balance is now " ++ show amount],(client,amount):accounts)

balance :: Client -> BankState -> BankState
balance client (messages,accounts) = case lookup client accounts of
    Just amount -> (messages ++ [show amount], accounts)
    Nothing     -> (messages ++ ["0"], accounts)
        

message :: Message -> BankState -> BankState
message m (messages,accounts) = (messages ++ [m], accounts)
readInt :: String -> [Int]
readInt = fmap fst . reads 
