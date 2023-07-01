module BonusMalus where

import Control.Arrow

type Coef = Integer
data Driver = New
            | Existing Coef [Accident]

type Date = Integer
data Accident = Liable Date 
              | Split Date 

coefBounds :: Coef -> Coef
coefBounds = max bestCoef . min worstCoef 
  where
    bestCoef = 50
    worstCoef = 350	

coefficientFor :: Driver -> Coef
coefficientFor New = 100
coefficientFor (Existing coef _) = coef  

existing :: [Accident] -> Bool
existing accidents = length accidents /= 0 

no :: [Accident] -> Bool
no accidents = length accidents == 0

happeningAfter :: [Accident] -> Date -> [Accident]
happeningAfter accidents date = filter (accidentAfter date) accidents 

accidentAfter :: Date -> Accident -> Bool
accidentAfter limit (Liable date) = date < limit
accidentAfter limit (Split date) = date < limit

nextCoef :: Driver -> Coef
nextCoef = driverEvolution >>> twoYearGrace >>> coefficientFor >>> coefBounds

twoYearGrace :: Driver -> Driver 
twoYearGrace New = New 
twoYearGrace driver @ (Existing _ accidents) 
                    | existing (accidents `happeningAfter` 2) = driver 
                    | otherwise = graceHaircut driver 
  where
    graceHaircut :: Driver -> Driver 
    graceHaircut (Existing coef accidents) = (Existing (min 100 coef) accidents)

driverEvolution :: Driver -> Driver 
driverEvolution New = Existing 100 []
driverEvolution driver @ (Existing _ accidents) 
                       | no (accidents `happeningAfter` 1) = applyBonus driver 
                       | otherwise = applyPenalty driver									 

apply :: Double -> Coef -> Coef
apply factor = fromInteger >>> (* factor) >>> truncate

applyBonus :: Driver -> Driver 
applyBonus (Existing previousCoef accidents) = Existing newCoef accidents
  where
    yearlyBonusEvolution = 0.95 
    zeroAccidentBonus :: Coef -> Coef
    zeroAccidentBonus = apply yearlyBonusEvolution
    newCoef = zeroAccidentBonus previousCoef

applyPenalty :: Driver -> Driver 
applyPenalty (Existing previousCoef accidents) = Existing (sumPenalties accidents previousCoef) accidents 
  where
    liablePenaltyValue = 1.25
    fullPenalty = apply liablePenaltyValue
    splitPenaltyValue = 1.125
    splitPenalty = apply splitPenaltyValue 
    sumPenalties :: [Accident] -> Coef -> Coef
    sumPenalties [] = id
    sumPenalties (Liable _:other) = fullPenalty . (sumPenalties other)
    sumPenalties (Split _:other)  = splitPenalty . (sumPenalties other)
