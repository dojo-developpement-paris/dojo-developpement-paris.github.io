module Parser (repl, prefix, debug) where
import Data.Maybe

repl = interact (unlines . map prefix . lines)

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

type Unary = Char
type Binary = Char
type Parser a = String -> [(a,String)]

data Tree a = Nil 
            | Node a (Tree a) (Tree a)

data Token = V Value
           | B Binary
           | U Unary

prefix :: String -> String
prefix s = case (map fst . filter success . parse) s of
    [t] -> show (eval t)
    _ -> "error : incorrect prefix expression" 

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
    Just f -> [(U c,s)]
unaryParser _ = []

binaryParser :: Parser Token
binaryParser (c:s) = case lookup c binaries of
    Nothing -> []
    Just f -> [(B c,s)]
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
    grow (Node a Nil Nil) u = Node a u Nil
    grow (Node a t Nil) u = Node a t u

parserDummy :: Parser (Tree Token)
parserDummy "foo" = [(Node (V 42) Nil Nil,"")]
parserDummy _ = []

eval :: Tree Token -> Value
eval (Node (V n) _ _) = n
eval (Node (U c) t _) = let f = fromJust (lookup c unaries) in f (eval t)
eval (Node (B c) t u) = let f = fromJust (lookup c binaries) in f (eval t) (eval u)
