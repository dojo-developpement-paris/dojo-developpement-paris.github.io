module BonusAuto ( bonus, newDriver, driver, crashed )
    where


data History = NewDriver
             | Anniversary History
             | Accident History

-- Anniversary (Anniversary (Anniversary NewDriver))
-- Anniversary :: History -> History

bonus history = max 50 (bonus' history)

bonus' :: History -> Int
bonus' NewDriver               = 100
bonus' (Anniversary history) = div (bonus history *95) 100
bonus' (Accident history) = div ((bonus history) * 125) 100

newDriver :: History
newDriver = NewDriver

driver :: Int -> History
driver 0 = newDriver
driver n = Anniversary (driver (n-1))

crashed :: History -> History
crashed driver = Accident driver
