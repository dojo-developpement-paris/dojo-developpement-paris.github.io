module Bonus where

type Anciennete = Integer
type Coefficient = Integer
type Accidents = Integer

crm :: Anciennete -> Coefficient
crm 0 = coefficientInitial
crm anciennete = max coefficientMinimum $  evolution anneePrecedente
        where
        anneePrecedente = crm (anciennete - 1)

        evolution :: Coefficient -> Coefficient
        evolution = truncate . (* coefficientReduction) . fromInteger 

        coefficientReduction = 0.95

        coefficientMinimum = 50

coefficientInitial = 100

coefficientSuivant :: Coefficient -> Accidents -> Coefficient
coefficientSuivant precedent accidents = evolution precedent
        where
        evolution :: Coefficient -> Coefficient
        evolution = truncate . (* coefficientReduction) . fromInteger 

        coefficientReduction | accidents > 0= 1 + 0.25 * fromInteger accidents
                            | otherwise = 0.95
