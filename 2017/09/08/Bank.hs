module Bank where


data Date  = Date Int Int Int
    deriving (Eq, Show)

instance Ord Date where
    compare d d' = compare (align d) (align d')
        where align (Date year month day) = year * 10000 + month * 100 + day

newtype Money = Money Int
    deriving (Eq, Show)

type Operation = (Date, Money)

data Account = Account { balance :: Date -> Money, operations :: [Operation] }

balance' :: Account -> Date -> Money
balance' acc date =  Money $ sum [ m | (d,(Money m)) <- operations acc, d <= date]

initial :: Account
initial = Account (const (Money 0)) []

deposit :: Money -> Date -> Account -> Account
deposit (Money dep) date acc  = 
    Account (\d -> let newBalance = Money (old + dep)
                       (Money old) = balance acc d in if d < date then Money old else newBalance) ((date,Money dep) : operations acc)
    -- lambda arg is not seen in a where clause 

withdraw :: Money -> Date -> Account -> Account
withdraw (Money dep) date acc  = 
    Account (\d -> let newBalance = Money (old - dep) 
                       (Money old) = balance acc d in if d < date then Money old else newBalance)((date, Money (-dep)) : operations acc)
