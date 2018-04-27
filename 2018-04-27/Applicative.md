# Applicative

### 1. Robinson wants to calculate hypotenuses. 

He writes the following lines:

    let sq x = x * x ⏎
    let hyp a b = sqrt $ sq a + sq b ⏎
    hyp 3 4 ⏎
    5.0

Pretty cool, isn't it ?

### 2. Of course, Robinson wants to use his function in a context where it will process String entries.
He remembers this :

    let val s = case reads s of [] -> Nothing ; [(n,_)] -> Just n ⏎

But there is no way he can fmap his hyp function :

    fmap hyp (val "3") (val "4") ⏎

    error:
    • Couldn't match expected type ‘Maybe a0 -> t’
                  with actual type ‘Maybe (Double -> Double)’
    • The function ‘fmap’ is applied to three arguments,
      but its type ‘(Double -> Double -> Double)
                    -> Maybe Double -> Maybe (Double -> Double)’
      has only two

What's to be done ?

    :type sq ⏎
    sq :: Num a => a -> a
    :type hyp ⏎
    hyp :: Floating a => a -> a -> a
    :type fmap sq ⏎
    fmap sq :: (Num b, Functor f) => f b -> f b
    :type fmap hyp ⏎
    fmap hyp :: (Floating a, Functor f) => f a -> f (a -> a)

When he uses partial application, Robinson gets a Maybe function!

    :type fmap hyp (Just 3) ⏎
    fmap hyp (Just 3) :: Floating a => Maybe (a -> a)

### 3. What can we do with a Maybe function ? 

Apply it to a value. But for that we need an application function:

    let ap Nothing _ = Nothing; ap (Just f) x = fmap f x ⏎
    :type ap ⏎
    ap :: Maype (a1 -> a) -> Maybe a1 -> Maybe a

Robinson checks with :type that this is what he needs:
    
    :type ap $ fmap hyp $ Just 3 ⏎
    ap $ fmap hyp $ Just 3 :: Floating a => Maybe a -> Maybe a
    :type (ap $ fmap hyp $ Just 3) $ Just 4 ⏎
    (ap $ fmap hyp $ Just 3) $ Just 4 :: Floating a => Maybe a

### 4. Robinson then tries it :

    (ap $ fmap hyp $ Just 3) $ Just 4 ⏎
    Just 5.0
    (ap $ fmap hyp $ Nothing) $ Just 4 ⏎
    Nothing
    (ap $ fmap hyp $ Just 3) $ Nothing ⏎
    Nothing
    (ap $ fmap hyp $ Nothing) $ Nothing ⏎
    Nothing

### 5. Of course, the expression is better formulated by infixing the ap function:

    fmap hyp (Just 3) `ap`  (Just 4) ⏎
    Just 5.0
    fmap hyp (Just 3) `ap` (Just 4) ⏎
    Just 5.0
    fmap hyp Nothing `ap` (Just 4) ⏎
    Nothing

### 6. He creates a new infix operator for smoother expression :

    let infixl 4 <*>;  (<*>) = ap ⏎

He can now use fmap and ap operators :

    hyp <$> Just 3 <*> Just 4 ⏎
    Just 5.0
    hyp <$> Nothing <*> Just 4 ⏎
    Nothing
    hyp <$> Just 3 <*> Nothing ⏎
    Nothing

### 7. Perfect! He can now use that in combination with his String -> Maybe a function!

    hyp <$> val "3" <*> val "4" ⏎
    Just 5.0
    hyp <$> val "3" <*> val "foo" ⏎
    Nothing
    hyp <$> val "foo" <*> val "4" ⏎
    Nothing

### 8. Robinson wonders if what he created exist for other Functors than Maybe ?
He hoogles for a signature similar to his ap function:
  
    Hoog\e : f (a -> b) -> f a -> f b ⏎
    (<*>) :: Applicative f => f (a -> b) -> f a -> f b

Stupendous ! No need to write ap functions and operators !

    let sq x = x * x ⏎
    let hyp a b = sqrt $ sq a + sq b ⏎
    let val s = case reads s of [] -> Nothing ; [(n,_)] -> Just n ⏎
    hyp <$> val "3" <*> val "4" ⏎
    Just 5.0

### 9. But Robinson asks: what is an Applicative?

    class Functor f => Applicative (f :: * -> *) where
      pure :: a -> f a
      (<*>) :: f (a -> b) -> f a -> f b
      (*>) :: f a -> f b -> f b
      (<*) :: f a -> f b -> f a
      {-# MINIMAL pure, (<*>) #-}
        -- Defined in ‘GHC.Base’
    instance Applicative (Either e) -- Defined in ‘Data.Either’
    instance Applicative [] -- Defined in ‘GHC.Base’
    instance Applicative Maybe -- Defined in ‘GHC.Base’
    instance Applicative IO -- Defined in ‘GHC.Base’
    instance Applicative ((->) a) -- Defined in ‘GHC.Base’
    instance Monoid a => Applicative ((,) a) -- Defined in ‘GHC.Base’

### 10. And what does pure means ? Obviously pure puts a value in an Applicative context.
For example, take vol, another one of Robinson's favorite functions:

    let vol w h d = w * h * d ⏎

    pure vol <*> pure 3 <*> pure 4 <*> pure 5 :: Maybe Int ⏎
    Just 60
    pure vol <*> pure 3 <*> pure 4 <*> pure 5 :: [Int] ⏎
    [60]
    
### 11. This list capability is interesting Robinson. He tries:

    pure vol <*> [3,5,8] <*> [4,6] <*> [5,9] ⏎
    [60,108,90,162,100,180,150,270,160,288,240,432]

He can calculate all the possible volumes given sizes ranges

### 12. But what if he wanted to calculates only 3 different volumes, given by series of 3 sizes ?

He creates a new type for that:

    data List a = List [a] deriving (Eq,Show)  ⏎

This type will be a Functor:

    instance Functor List where fmap f (List xs) = List (fmap f xs) ⏎
    fmap sq $ List [1,2,4]  ⏎
    List [1,4,9]

This type will also be an Applicative:

    instance Applicative List where pure a = List [a] ; List fs <*> List xs = List $ zipWith ($) (cycle fs) xs ⏎

### 13. Now, Robinson can use [] or List, depending on what he wants when combining his (applicative) lists.

    pure (*) <*> [1..4] <*> [1..4] ⏎
    [1,2,3,4,2,4,6,8,3,6,9,12,4,8,12,16]    

    pure (*) <*> List [1..4] <*> List [1..4] ⏎
    List [1,4,9,16]

    
### 14. Then Robinson has a strange idea: to write a conditionnal function.

    let cond b x y = if b then x else y ⏎
    cond True "foo" "bar" ⏎
    "foo"
    cond False "foo" "bar" ⏎
    "bar"
    
### 15. He thinks 'that's cool because I can use it in an applicative context has well' :

    pure cond <*> pure False <*> pure 42 <*> pure 4807 ⏎
    4807
    pure cond <*> pure True <*> pure 42 <*> pure 4807 ⏎
    42

### 16. Then he decides, that in certain cases he can leave the false branch  undefined
    pure cond <*> pure True <*> pure 42 <*> undefined ⏎
    CallStack (from HasCallStack):
        error, called at libraries/base/GHC/Err.hs:79:14 in base:GHC.Err
        undefined, called at <interactive>:91:41 in interactive:Ghci56

Uh ? 

    cond True 42 undefined ⏎
    42
    cond False undefined 4807 ⏎
    4807
    pure cond <*> pure True <*> pure 42 <*> undefined ⏎
    CallStack (from HasCallStack):
        error, called at libraries/base/GHC/Err.hs:79:14 in base:GHC.Err
        undefined, called at <interactive>:95:41 in interactive:Ghci58

Robinson thought that Haskell was lazy.

### 17. But Applicative Functors are not lazy: they apply their function to their arguments, once evaluated

Robinson thinks: if every argument in an Applicative function call are evaluated, that means that I can sequence them.

    let seq a b = b ⏎
    seq undefined 42 ⏎
    42

    pure seq <*> undefined <*> pure 42 ⏎
    CallStack (from HasCallStack):
        error, called at libraries/base/GHC/Err.hs:79:14 in base:GHC.Err
        undefined, called at <interactive>:5:14 in interactive:Ghci3
    
### 18. 'Hurray' says Robinson, because he had tried for so long to sequence 2 IO ():

    seq (putStr "foo") (putStrLn "bar") ⏎
    bar
    pure seq <*> putStr "foo" <*> putStrLn "bar"
    foobar

    pure seq <*> putStr "foo" <*> pure seq <*> putStr "bar" <*> putStr "qux"  ⏎
    foobarqux

### 19. Robinson creates an operator:

    infixl 4 *>; a *> b = pure seq <*> a <*> b ⏎

    putStr "foo" *> putStr "bar" *> putStr "qux"
    foobarqux

### 20. I'm a genius! He says but he soon discovers that he was only standing of the toes of giants:

    hoog\le : a -> b -> b
    seq :: a -> b -> b

    hoog\le : f a -> f b -> f b
    (*>) :: Applicative f => f a -> f b -> f b

Applicatives!



