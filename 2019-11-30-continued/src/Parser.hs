{-# LANGUAGE GADTs #-}
module Parser (repl, normal, debug) where
import Data.Maybe

repl mode = interact (unlines . map mode . lines)

type Value = Integer

type Operation = Char
type Parser a = String -> [(a,String)]

data Op a = Op a
data Val = Val

data Expr typ where
   V :: Value -> Expr Val
   Lambda :: Operation -> Expr (Op a)
   Apply :: Expr (Op a) -> Expr Val -> Expr a

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

parse :: Parser (Expr Val)
parse = expression

expression :: Parser (Expr Val)
expression = number 
           <|> (unary <&> expression)
           <|> (binary <&> expression <&> expression)

number = spaces valueParser 
unary  = spaces (uParser unaries)
binary = spaces (bParser binaries)
           

valueParser :: Parser (Expr Val)
valueParser s = case reads s of
    [(n,s')] | n >= 0 -> [(V n, s')]
    _ -> []  

fact n = product [1..n]

unaries = zip "-!" [negate, fact]
binaries= zip "+-*/%" [(+),(-),(*),div,mod]

uParser :: [(Char, f)] -> Parser (Expr (Op Val))
uParser uParsers (c:s) = case lookup c uParsers of
    Nothing -> []
    Just f -> [(Lambda c,s)]
uParser _ _ = []


bParser :: [(Char, f)] -> Parser (Expr (Op (Op Val)))
bParser uParsers (c:s) = case lookup c uParsers of
    Nothing -> []
    Just f -> [(Lambda c,s)]
bParser _ _ = []

spaces :: Parser a -> Parser a
spaces p (' ':rest) = spaces p rest
spaces p s       = p s

infixl 2 <|>
(<|>) :: Parser a -> Parser a -> Parser a 
(p <|> q) s = p s <> q s

infixl 3 <&>
(<&>) :: Parser (Expr (Op a)) -> Parser (Expr Val) -> Parser (Expr a)
(p <&> q) s = case p s of
    [] -> []
    rs -> [(Apply a b, s'')
          | (a,s') <- rs
          , (b,s'') <- q s']

eval :: Expr Val -> Value
eval (V n) = n
eval (Apply (Lambda c) t) = let f = fromJust (lookup c unaries) in f (eval t)
eval (Apply (Apply (Lambda c) t) u) = let f = fromJust (lookup c binaries) in f (eval t) (eval u)
