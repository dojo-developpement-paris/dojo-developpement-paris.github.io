module BonusMalus where

import Control.Arrow

type Coef = Integer
type Driver = Maybe (Coef, [Accident])

type AccidentAge = Integer
data Accident = Accident AccidentAge Liability
data Liability = Liable | Split

age :: Accident -> AccidentAge
age (Accident age _)= age

coefBounds :: Coef -> Coef
coefBounds = max bestCoef . min worstCoef 
  where
    bestCoef = 50
    worstCoef = 350	

coefFor :: Driver -> Coef
coefFor (Just (coef, _)) = coef  

no :: [Accident] -> Bool
no accidents = length accidents == 0

moreRecentThan :: [Accident] -> AccidentAge -> [Accident]
moreRecentThan accidents limit = filter ((limit >) . age) accidents 

nextCoef :: Driver -> Coef
nextCoef = driverEvolution >>> twoYearGrace >>> coefFor >>> coefBounds

twoYearGrace :: Driver -> Driver 
twoYearGrace driver @ (Just (_, accidents)) 
                    | no (accidents `moreRecentThan` 2) = fmap graceHaircut driver 
                    | otherwise = driver 
  where
    graceHaircut (coef, accidents)= (min 100 coef, accidents)

driverEvolution :: Driver -> Driver 
driverEvolution Nothing = Just (100, [])
driverEvolution driver @ (Just (_, accidents)) 
                       | no (accidents `moreRecentThan` 1) = applyBonus driver 
                       | otherwise = applyPenalty driver									 

apply :: Double -> Coef -> Coef
apply factor = fromInteger >>> (* factor) >>> truncate

applyBonus :: Driver -> Driver 
applyBonus (Just(previousCoef, accidents)) = Just(newCoef, accidents)
  where
    yearlyBonusEvolution = 0.95 
    zeroAccidentBonus :: Coef -> Coef
    zeroAccidentBonus = apply yearlyBonusEvolution
    newCoef = zeroAccidentBonus previousCoef

applyPenalty :: Driver -> Driver 
applyPenalty (Just (previousCoef, accidents)) = Just ((foldr sumPenalties previousCoef accidents), accidents) 
  where
    sumPenalties :: Accident -> Coef -> Coef
    sumPenalties (Accident _ r) = apply (penaltyFor r)
    penaltyFor Liable = 1.25
    penaltyFor Split  = 1.125

