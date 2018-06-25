-- https://www.codewars.com/kata/56606694ec01347ce800001b

import Data.List (sort)

isTriangle :: Int -> Int -> Int -> Bool
isTriangle a b c = s0 < s1 + s2
  where [s0, s1, s2] = reverse $ sort [a, b, c]
