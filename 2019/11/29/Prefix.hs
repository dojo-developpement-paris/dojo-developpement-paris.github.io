main = interact (unlines . map prefix . lines)

-- "*+42 17!5"
--
-- (*
--      (+
--          42
--          17)
--      (!
--          5))
--


type Value = Integer
type Unary = Value -> Value
type Binary = Value -> Value -> Value

type Parser a = String -> [(a,String)]

data Tree a = Nil 
            | Node a (Tree a) (Tree a)

data Token = V Value
           | U Unary
           | B Binary

prefix :: String -> String
prefix s = case parse s of
    [] -> "error : incorrect prefix expression" 
    [(t,"")] -> show (eval t)
    [(_,s)]  -> "error: extra chars in expression, Master : " ++ s
    

parse :: Parser (Tree Token)
parse = expression

expression = number 
           <|> (binary <&> expression <&> expression)
           <|> (unary <&> expression)

number = spaces (leaf valueParser) 
unary  = spaces (leaf unaryParser)
binary = spaces (leaf binaryParser)
           

valueParser :: Parser Token
valueParser s = case reads s of
    [(n,s')] | n >= 0 -> [(V n, s')]
    _ -> []  

fact n = product [1..n]

unaryParser :: Parser Token
unaryParser ('-':s) = [(U negate,s)]
unaryParser ('!':s) = [(U fact,s)]
unaryParser _ = []


binaryParser :: Parser Token
binaryParser ('+':s) = [(B (+),s)]
binaryParser ('-':s) = [(B (-),s)]
binaryParser ('*':s) = [(B (*),s)]
binaryParser ('/':s) = [(B div,s)]
binaryParser ('%':s) = [(B mod,s)]
binaryParser _ = []


-- *+42 17 !5
-- Node (B (*)) 
--       Node (B (+))  
--          Node (V 42) Nil Nil
--          Node (V 17) Nil Nil
--       Node (U (fact)) 
--          (Node (V 5) Nil Nil)
--          Nil
--
--
leaf :: Parser a -> Parser (Tree a) 
leaf p = fmap (\(a,s) -> (Node a Nil Nil, s)) . p

spaces :: Parser a -> Parser a
spaces p (' ':rest) = spaces p rest
spaces p s       = p s

infixl 2 <|>
(<|>) :: Parser a -> Parser a -> Parser a 
(p <|> q) s = case p s of
    [] -> q s
    rs -> rs

infixl 3 <&>
(<&>) :: Parser (Tree a) -> Parser (Tree a) -> Parser (Tree a)
(p <&> q) s = case p s of
    [] -> []
    rs -> [(grow a b, s'')
          | (a,s') <- rs
          , (b,s'') <- q s']
    where
    grow :: Tree a -> Tree a -> Tree a
    grow Nil t = t
    grow (Node a Nil Nil) u = Node a u Nil
    grow (Node a t Nil) u = Node a t u

parserDummy :: Parser (Tree Token)
parserDummy "foo" = [(Node (V 42) Nil Nil,"")]
parserDummy _ = []

eval :: Tree Token -> Value
eval (Node (V n) _ _) = n
eval (Node (U f) t _) = f (eval t)
eval (Node (B f) t u) = f (eval t) (eval u)
