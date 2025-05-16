{-# LANGUAGE OverloadedStrings #-}

module Memory where

import Data.Text qualified as T

type ListeDesCartes = T.Text
type Coup = (Int, Int)

at :: T.Text -> Int -> T.Text
at liste index = T.singleton (T.index liste index)

play :: ListeDesCartes -> Coup -> ListeDesCartes
play cartes (index1, index2)
    | cartes `at` index1 == cartes `at` index2 =
        T.replace (cartes `at` index1) "" cartes
play liste _ = liste

gagning :: ListeDesCartes -> Bool
gagning = T.null
