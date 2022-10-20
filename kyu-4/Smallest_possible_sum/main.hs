-- https://www.codewars.com/kata/52f677797c461daaf7000740

smallestPossibleSum :: (Integral a) => [a] -> a
smallestPossibleSum [] = 0
smallestPossibleSum xs = fromIntegral (length xs) * foldl1 gcd xs
