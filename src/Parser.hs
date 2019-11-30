module Parser (repl, normal, debug) where
import Data.Maybe

repl mode = interact (unlines . map mode . lines)

type Value = Integer

type Operation = Char
type Parser a = String -> [(a,String)]

data Tree a = Nil 
            | Node a (Tree a)

data Token = V Value
           | Lambda Operation
           | Apply Operation (Tree Token)

normal :: String -> String
normal s = case (map fst . filter success . parse) s of
    [t] -> show (eval t)
    _ -> "Parsing of the expression failed" 

debug :: String -> String
debug s = case parse s of
    [] -> "error : incorrect prefix expression" 
    rs -> unlines [show (eval t) ++ " (" ++ s ++ ")"
                  | (t,s) <- rs]

success :: (a,String) -> Bool
success = null . snd

parse :: Parser (Tree Token)
parse = expression

expression :: Parser (Tree Token)
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

unaries = zip "-!" [negate, fact]
binaries= zip "+-*/%" [(+),(-),(*),div,mod]

unaryParser :: Parser Token
unaryParser (c:s) = case lookup c unaries of
    Nothing -> []
    Just f -> [(Lambda c,s)]
unaryParser _ = []

binaryParser :: Parser Token
binaryParser (c:s) = case lookup c binaries of
    Nothing -> []
    Just f -> [(Lambda c,s)]
binaryParser _ = []

leaf :: Parser a -> Parser (Tree a) 
leaf p = fmap (\(a,s) -> (Node a Nil, s)) . p

spaces :: Parser a -> Parser a
spaces p (' ':rest) = spaces p rest
spaces p s       = p s

infixl 2 <|>
(<|>) :: Parser a -> Parser a -> Parser a 
(p <|> q) s = p s <> q s

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
    grow (Node a Nil) u = Node a u
    grow (Node a t) u = Node (Apply a t) u

eval :: Tree Token -> Value
eval (Node (V n) _) = n
eval (Node (Lambda c) t) = eval (Node (Apply c t) Nil)
--eval (Node (Lambda c) t u) = eval (Node (Apply c t) u)
eval (Node (Apply c t) Nil) = let f = fromJust (lookup c unaries) in f (eval t)
eval (Node (Apply c t) u) = let f = fromJust (lookup c binaries) in f (eval t) (eval u)
