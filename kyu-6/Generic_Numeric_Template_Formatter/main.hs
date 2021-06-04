-- https://www.codewars.com/kata/59901fb5917839fe41000029/

import Data.Char (isAlpha)

solve :: String -> String -> String
solve [] _ = []
solve (t:ts) numbers@(n:ns)
  | isAlpha t = n : solve ts ns
  | otherwise = t : solve ts numbers

numericFormatter :: String -> String -> String
numericFormatter template numbers = solve template (cycle numbers')
  where
    numbers' = if length numbers == 0 then (['1'..'9'] ++ "0") else numbers
