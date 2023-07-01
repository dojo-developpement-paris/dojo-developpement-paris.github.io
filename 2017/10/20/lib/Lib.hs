module Lib where

import Text.Trifecta hiding (parens)
import Control.Applicative ((<|>))
import Prelude hiding (product)

-- | This is a helper function to make the repl easier to use.
--   It wraps a call to trifecta's parse function and massages
--   the output.
p :: Parser t -> String -> t
p parser input =
  let res = parseString (parser <* eof) mempty input
  in case res of
    Failure f -> error (show (_errDoc f))
    Success n -> n

pfails :: Parser t -> String -> ()
pfails parser input =
  case (parseString (parser <* eof) mempty input)
   of
    Failure f -> ()
    Success n -> error "This parser was supposed to fail"

somea :: Parser String
somea = some (char 'a')

manya :: Parser String
manya = many (char 'a')

digit' :: Parser Char
digit' = oneOf ['0'..'9']

num :: Parser Double
num = read <$> (some digit') 

expression :: Parser Double
expression = try add <|> product

product :: Parser Double
product = try mul <|> factor

factor :: Parser Double
factor = try parens <|> num

add :: Parser Double
add = do
  left <- product
  char '+'
  right <- expression
  pure (left + right)
  
mul :: Parser Double
mul = do 
  left <- factor
  char '*'
  right <- product
  pure (left * right)

parens :: Parser Double
parens = do
  char '('
  expr <-expression
  char ')'
  pure (expr)
