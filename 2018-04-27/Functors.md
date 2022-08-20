# Functors

### 1. Robinson wants to compute the square of 17.

In ghci, it's easy:

    17 * 17 ⏎
    289

### 2. Now Robinson wants to compute the square of any number, given once, as a parameter. 

Still very easy:

    (\x -> x * x) 42 ⏎
    1764

### 3. He can even bind this function to a name:

    let sq x = x * x ⏎
    sq 42 ⏎
    1764

### 4. Robinson thinks about Strings:

Robinson's been told that programs initially receive all their parameters as Strings. Therefore he wants to compute the square of a number when the given argument is a String.

No big deal:

    sq (read "42") ⏎

or

    sq $ read "42" ⏎
    1764

because ($) :: (a -> b) -> a -> b is the function application function.

### 5. Then, Robinson meets a special case.

    (\x -> x*x) $ read "foo" ⏎
    *** Exception: Prelude.read: no parse

He does'nt like that.

He learns about a function reads :: Read a => ReadS a , that is if a is a readable type, reads is of type ReadS a.

He learns that

    :info ReadS ⏎
    type ReadS a = String -> [(a, String)]

thus:

    (reads :: ReadS Int) "42" ⏎
    [(42,"")]
    (reads :: ReadS Int) "foo" ⏎
    []

### 6. Robinson knows about pairs, and lists. 

He knows that fst :: (a,b) -> a and that map :: (a -> b) -> [a] -> [b] Thus:

    map fst $ (reads :: ReadS Int) "42" ⏎
    [42]
    map fst $ (reads :: ReadS Int) "foo" ⏎
    []

### 7. Now he can write an expression that is guaranteed to not provoke an halt in the program.

    map sq $ map fst $ reads "42" ⏎
    [1764]
    map sq $ map fst $ reads "foo" ⏎
    []

Robinson uses the List as the Optional type.

### 8. But there should be a better way to epxress Option than List.

Robinson creates his own type:

    data Option = Val Int | NotAVal deriving (Eq,Show) ⏎
    :type Val 42 ⏎
    Val 42 :: Option
    :type NotAVal ⏎
    NotAVal :: Option
    
### 9. He can now write his reader for Int:

    let val s = case reads s of [] -> NotAVal ; [(n,_)] -> Val n
    val "42" ⏎
    Val 42
    val "foo" ⏎
    NotAVal

### 10. Cool. But now, how to map a function on that kind of values ?

Robinson creates a function mapper for his Option type.

    let fmap _ NotAVal = NotAVal ; fmap f (Val x) = Val (f x)

Now he can map any Int -> Int function to his Option values

    fmap sq $ val "42" ⏎
    Val 1764
    fmap sq $ val "foo" ⏎
    NotAVal

### 11. Robinson thinks a bit more and realizes that he might need Options for more types:

Optional Double values as well as Int so he generalizes his function:

    let val s = case reads s of [] -> NotAVal ; [(n,_)] -> Val n
    val "foo" ⏎
    NotAVal
    val "42" ⏎
    NotAVal
    
Uh ?

    val "42" :: Option Int ⏎
    Val 42
    val "48.07" :: Option Int ⏎
    NotAVal
    val "48.07" :: Option Double ⏎
    Val 48.07

OK.

### 12. Now he needs to rewrite fmap :

    let fmap _ NotAVal = NotAVal ; fmap f (Val n) = Val (f n) ⏎
    fmap (\x -> x*x) $ val "42" ⏎
    Val 1764
    fmap (\x -> x*x) $ val "48.07" :: Option Double ⏎
    Val 2310.7249
    

    :t fmap ⏎
    fmap :: (t -> a) -> Option t -> Option a

### 13. Robinson is proud, but he wonders if somebody else has though of this before. 

    Hoog\e : fmap ⏎
    fmap :: Functor f => (a -> b) -> f a -> f b

What's the heck is a Functor ?

    class Functor (f :: * -> *) where
      Prelude.fmap :: (a -> b) -> f a -> f b
      (<$) :: a -> f b -> f a
      {-# MINIMAL fmap #-}
        -- Defined in ‘GHC.Base’
    instance Functor (Either a) -- Defined in ‘Data.Either’
    instance Functor [] -- Defined in ‘GHC.Base’
    instance Functor Maybe -- Defined in ‘GHC.Base’
    instance Functor IO -- Defined in ‘GHC.Base’
    instance Functor ((->) r) -- Defined in ‘GHC.Base’
    instance Functor ((,) a) -- Defined in ‘GHC.Base’

### 14. Robinson then discover Maybe.

    data Maybe a = Nothing | Just a 	-- Defined in ‘GHC.Base’
    instance Eq a => Eq (Maybe a) -- Defined in ‘GHC.Base’
    instance Monad Maybe -- Defined in ‘GHC.Base’
    instance Functor Maybe -- Defined in ‘GHC.Base’
    ...

### 15. So a Maybe value can be mapped a function onto with fmap ?

    fmap sq $ Just 42
    <interactive>:36:18: error:
        • Couldn't match expected type ‘Option a’
                      with actual type ‘Maybe Integer’
    • In the second argument of ‘($)’, namely ‘Just 42’
      In the expression: fmap sq $ Just 42
      In an equation for ‘it’: it = fmap sq $ Just 42
    • Relevant bindings include
        it :: Option a (bound at <interactive>:36:1)

Well, as soon as GHCI will have forgotten Robinson's own fmap

    :quit
    ghci

    let sq x = x * x ⏎
    fmap sq $ Just 42 ⏎
    Just 1764
    fmap sq $ Just 48.07 ⏎
    Just 2310.7249
    fmap sq $ Nothing ⏎
    Nothing

### 16. Now he can rewrite his functions for Maybe

    let sq x = x * x ⏎
    let val s = case reads s of [] -> Nothing ; [(n,_)] -> Just n ⏎
    :t val ⏎
    val :: Read a => String -> Maybe a

And he still has his program, based on a Functor:

    fmap sq $ val "42" ⏎
    Just 1764
    fmap sq $ val "foo" ⏎
    Nothing

### 17. Exploring further

Robinson discovers that ((->) r) is also a Functor. Does that mean that he can fmap a function over a function ??

    :type fmap sq sq ⏎
    fmap sq sq :: Num b => b -> b
    fmap negate sq 42 ⏎
    -1742
    fmap sq sq 42 ⏎
    3111696

### 18. Wow! Then Robinson writes a unique top level function :

    let pro = fmap (fmap sq) val ⏎
    pro "42" ⏎
    Just 1764
    pro "foo" ⏎
    Nothing

Functors!

### 19. But what he likes better is to have an operator:
    
    sq <$> val "42" ⏎
    Just 1764

### 20. One day, Robinson has a strange idea

I'm going to count applications of functions on a value. He creates this new type:

    data Cap a = Cap Int a deriving (Eq,Show) ⏎
    instance Functor Cap where fmap f (Cap n x) = Cap (n+1) (f x) ⏎
    
    sq <$> Cap 0 42 ⏎
    Cap 1 1764
    (*10) <$> negate <$> sq <$> Cap 0 42 ⏎
    Cap 1 (-17640)
    (*10) <$> (negate <$> (sq <$> Cap 0 42)) ⏎
    Cap 3 (-17640)

Uh Oh...

Robinson realizes that his Functor is breaking the laws of functors
    
- fmap id === id
- fmap (g.h) === (fmap g) . (fmap h)


This can be verified with concrete cases : 

    fmap id (Cap 0 42) == id (Cap 0 42)
    False
    (fmap (negate . sq) (Cap 0 42)) == (fmap negate $ fmap sq (Cap 0 42))
    False

