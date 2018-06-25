-- https://www.codewars.com/kata/54ba84be607a92aa900000f1

import Data.Char (toUpper, toLower)

isIsogram :: String -> Bool
isIsogram [] = True
isIsogram [x] = True
isIsogram (x:xs)
  | toUpper x `notElem` xs && toLower x `notElem` xs = isIsogram xs
  | otherwise = False
