# Monads

The sad thing with Applicatives, Robinson thinks, is that I can combine my computations together, but I cannot have them interact with one another.

1. For example let's imagine that as well as "foo", negative number are not allowed.

    let pos x = if x > 0 then Just x else Nothing ⏎
    pos 0  ⏎
    Nothing
    pos (-42) ⏎
    Nothing
    pos 42 ⏎
    Just 42

2. It would be cool to have pos interact with val:

    let val s = case reads s of [] -> Nothing ; [(n,_)] -> Just x

But we can't:

    :type pos $ val  ⏎

does'nt typecheck, and

    :type pos <$> val  ⏎
    pos <$> val :: (Read a, Num (Maybe a), Ord a) => String -> Maybe (Maybe a)

escalates the Functor!

3. I know, says Robinson, I will write a helper function to join the 2 Functor values together:

    let join Nothing = Nothing ; join (Just x) = x ⏎
    join Nothing  ⏎
    Nothing
    join (Just Nothing) ⏎
    Nothing
    join (Just (Just 42)) ⏎
    Just 42

Now let's try:

    join $ pos <$> val "foo" ⏎
    Nothing
    join $ pos <$> val "0" ⏎
    Nothing
    join $ pos <$> val "-1" ⏎
    Nothing
    join $ pos <$> val "42" ⏎
    Just 42

It works!

4. Robinson creates a binding function:

    let bind x f = join $ fmap f x ⏎

    bind (val "foo") pos ⏎
    Nothing
    bind (val "42") pos ⏎
    Just 42
    bind (val "-42") pos ⏎
    Nothing

5. And an operator:

    let infixl 4 >>= ; x >>= f = bind x f
    val "foo" >>= pos
    Nothing
    val "42" >>= pos
    Just 42
    val "-42" >>= pos
    Nothing

6. Now Robinson creates a universal checker:

    let check p x = if p x then Just x else Nothing ⏎
    let pair x = x `mod` 2 == 0 ⏎
    val "42" >>= check (>0) >>= check (<10) >>= check pair ⏎
    Nothing
    val "8" >>= check (>0) >>= check (<10) >>= check pair ⏎
    Just 8
    val "1" >>= check (>0) >>= check (<10) >>= check pair ⏎
    Nothing
    val "-1" >>= check (>0) >>= check (<10) >>= check pair ⏎
    Nothing
    val "4" >>= check (>0) >>= check (<10) >>= check pair ⏎
    Just 4
    val "5" >>= check (>0) >>= check (<10) >>= check pair ⏎
    Nothing

7. Robinson wonders if his join function should exist for all kind of functors.

    Hoog\e : f (f a) -> f a
    join :: Monad m => m (m a) -> m a

It does not for Functor, but for Monads ?

8. Hey, what is a Monad ?

    class Applicative m => Monad (m :: * -> *) where
      (Prelude.>>=) :: m a -> (a -> m b) -> m b
      (>>) :: m a -> m b -> m b
      return :: a -> m a
      fail :: String -> m a
      {-# MINIMAL (>>=) #-}
        -- Defined in ‘GHC.Base’
    instance Monad (Either e) -- Defined in ‘Data.Either’
    instance Monad [] -- Defined in ‘GHC.Base’
    instance Monad Maybe -- Defined in ‘GHC.Base’
    instance Monad IO -- Defined in ‘GHC.Base’
    instance Monad ((->) r) -- Defined in ‘GHC.Base’
    instance Monoid a => Monad ((,) a) -- Defined in ‘GHC.Base’

9. Another Hoogle search gives him:

    Hoog\e : f a -> (a -> f b) -> f b
    (>>=) :: Monad m => m a -> (a -> m b) -> m b

Hooray!! I've even found my bind operator! My life is blessed.

10. Lists are Functors:

    fmap sq [1..10] ⏎

Lists are Applicatives:

    pure (*) <*> [1..3] <*> [1..3] ⏎
    
Lists are Monads:

    [1..3] >>= \x -> [sq x,sq (sq x)] ⏎
    
11. IO is a Functor:

    fmap (sq.read) getLine ⏎

IO is an Applicative:

    putStr "foo" *> putStrLn "bar" ⏎

IO is a Monad:

    getLine >>= \x -> putStrLn (show (sq (read x))) ⏎

12. What a Functor or an Applicative can do, a Monad can do:

    getLine >>= return . sq . read ⏎

    putStr "foo" >>= \x -> putStrLn "bar" ⏎
  
    putStr "foo" >> putStrLn "bar" ⏎

Monads!
