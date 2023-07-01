import Test.QuickCheck

data State = State { big :: Integer, small :: Integer }
    deriving (Eq, Show)

data Action = FillBig | FillSmall | EmptyBig | EmptySmall | PourBigIntoSmall | PourSmallIntoBig
    deriving (Eq, Show, Enum)


action :: Action -> State -> State
action FillBig    (State _ s) = State 5 s 
action FillSmall  (State b _) = State b 3
action EmptyBig   (State _ s) = State 0 s
action EmptySmall (State b _) = State b 0
action PourBigIntoSmall (State b s) = let q = min b (3 - s) in State (b-q) (s+q) 
action PourSmallIntoBig (State b s) = let q = min s (5 - b) in State (b+q) (s-q)

nextActions :: State -> [Action]
nextActions st = 
    let possible = map toEnum [0..5] 
    in filter (\a -> action a st /= st) possible

instance Arbitrary Action where
    arbitrary = do
        n <- choose (0,5)
        return (toEnum n) 

instance Arbitrary State where
    arbitrary = do
        b <- choose (0,5)
        s <- choose (0,3)
        return (State b s)
    

prop_action_is_equal_to_itself :: Action -> Bool
prop_action_is_equal_to_itself a = a == a

prop_state_invariant :: State -> Bool
prop_state_invariant st = (big st >= 0) && (big st <= 5) && (small st >= 0) && (small st <= 3) 

initial :: State
initial = State 0 0

prop_action_fill_big_put_5_into_big_and_preserve_small :: State -> Bool
prop_action_fill_big_put_5_into_big_and_preserve_small st = 
    let st' = action FillBig st
    in big st' == 5 && small st' == small st

prop_action_fill_small_put_3_into_small_and_preserve_big :: State -> Bool
prop_action_fill_small_put_3_into_small_and_preserve_big st = 
    let st' = action FillSmall st
    in small st' == 3 && big st' == big st

prop_action_empty_big_put_0_into_big_and_preserve_small :: State -> Bool
prop_action_empty_big_put_0_into_big_and_preserve_small st =
    let st' = action EmptyBig st
    in big st' == 0 && small st' == small st 
    
prop_action_empty_small_put_0_into_small_and_preserve_big :: State -> Bool
prop_action_empty_small_put_0_into_small_and_preserve_big st =
    let st' = action EmptySmall st
    in small st' == 0 && big st' == big st 

prop_action_pour_big_into_small_makes_small_bigger_and_big_smaller :: State -> Bool
prop_action_pour_big_into_small_makes_small_bigger_and_big_smaller st@(State 0 _) = action PourBigIntoSmall st == st
prop_action_pour_big_into_small_makes_small_bigger_and_big_smaller st@(State _ 3) = action PourBigIntoSmall st == st
prop_action_pour_big_into_small_makes_small_bigger_and_big_smaller st = 
    let st' = action PourBigIntoSmall st
    in big st' < big st && small st' > small st && prop_state_invariant st'

prop_action_pour_small_into_big_makes_big_bigger_and_small_smaller :: State -> Bool
prop_action_pour_small_into_big_makes_big_bigger_and_small_smaller st@(State _ 0) = action PourSmallIntoBig st == st
prop_action_pour_small_into_big_makes_big_bigger_and_small_smaller st@(State 5 _) = action PourSmallIntoBig st == st
prop_action_pour_small_into_big_makes_big_bigger_and_small_smaller st =
    let st' = action PourSmallIntoBig st
    in small st' < small st && big st' > big st && prop_state_invariant st'

prop_next_action_changes_state :: State -> Bool
prop_next_action_changes_state st = 
    let actions = nextActions st
        change_state st a = action a st /= st
    in all (change_state st) actions

main = do
    quickCheck prop_action_is_equal_to_itself
    quickCheck prop_state_invariant 
    quickCheck prop_action_fill_big_put_5_into_big_and_preserve_small
    quickCheck prop_action_fill_small_put_3_into_small_and_preserve_big
    quickCheck prop_action_empty_big_put_0_into_big_and_preserve_small
    quickCheck prop_action_empty_small_put_0_into_small_and_preserve_big
    quickCheck prop_action_pour_big_into_small_makes_small_bigger_and_big_smaller
    quickCheck prop_action_pour_small_into_big_makes_big_bigger_and_small_smaller
    quickCheck prop_next_action_changes_state
