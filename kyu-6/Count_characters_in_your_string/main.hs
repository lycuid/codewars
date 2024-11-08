-- https://www.codewars.com/kata/52efefcbcdf57161d4000091/train/haskell

import Data.List

count :: String -> [(Char,Int)]
count = map (\xs -> (head xs, length xs)) . group . sort
