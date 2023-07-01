module Bank where

data Operation = Deposit  Integer
               | Withdraw Integer
        deriving(Eq, Show)

type Account = [Operation]

teller :: Operation -> Account -> Account
teller operation account = operation : account 

newAccount :: Account
newAccount = []

balance :: Account -> Integer
balance account = 
    foldr applyOperation 0 account
  where
    applyOperation (Deposit  a) bal = bal + a 
    applyOperation (Withdraw a) bal = bal - a 

history :: Account -> [Operation]
history l = reverse l
