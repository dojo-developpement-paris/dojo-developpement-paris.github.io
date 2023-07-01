module Account (newAccount, balance, deposit, withdraw)
where

data Account = Account { balance :: Integer } 

newAccount = Account 0


deposit :: Integer -> Account -> Account
deposit x (Account b) = Account (b+x)

withdraw :: Integer -> Account -> Maybe Account
withdraw x (Account b) | b < x = Nothing
withdraw x (Account b) = Just $ Account (b-x)

