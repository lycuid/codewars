-- https://www.codewars.com/kata/56a946cd7bd95ccab2000055/

import Data.Char (isLower)

lowercaseCount :: [Char] -> Int
lowercaseCount = length . filter isLower
