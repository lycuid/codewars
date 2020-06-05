-- https://www.codewars.com/kata/5511b2f550906349a70004e1/

nonRecurUnitPow :: Integer -> [Integer]
nonRecurUnitPow x  = (:) x' . takeWhile (/=x') . map (unit . (^) x') $ [2..]
  where
    x' = unit x
    unit = flip mod 10

lastDigit :: Integer -> Integer -> Integer
lastDigit _ 0 = 1
lastDigit x y = units !! (fromIntegral index :: Int)
  where
    units = nonRecurUnitPow x
    index = mod (y-1) (toInteger $ length units)

