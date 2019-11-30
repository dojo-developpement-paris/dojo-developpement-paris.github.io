module Parser (repl)
where

repl = interact (unlines . map prefix . lines)

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
prefix s = case filter success $ parse s of
    [] -> "error : incorrect prefix expression" 
    [(t,"")] -> show (eval t)
    _ -> "ambiguous expression"

success :: (a, String) -> Bool
success (_,"") = True
success _      = False
  

parse :: Parser (Tree Token)
parse = expression

expression = number 
           <|> (unary <&> expression)
           <|> (binary <&> expression <&> expression)

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


leaf :: Parser a -> Parser (Tree a) 
leaf p = fmap (\(a,s) -> (Node a Nil Nil, s)) . p

spaces :: Parser a -> Parser a
spaces p (' ':rest) = spaces p rest
spaces p s       = p s

infixl 2 <|>
(<|>) :: Parser a -> Parser a -> Parser a 
(p <|> q) s = p s <> q s

infixl 3 <&>
(<&>) :: Parser (Tree a) -> Parser (Tree a) -> Parser (Tree a)
(p <&> q) s = 
    p s >>= 
        (\(prevTree, intermediate) -> 
            map (\(nextTree, remainder) -> (grow prevTree nextTree, remainder)) 
                (q intermediate)
        )
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
