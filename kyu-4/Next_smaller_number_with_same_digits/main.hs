-- https://www.codewars.com/kata/5659c6d896bc135c4c00021e

import Data.List (sort)

toDigits 0 = []
toDigits x = (toDigits $ x `div` 10) ++ [x `mod` 10]

fromDigits [] = 0
fromDigits (x:xs) = x * (10^length xs) + fromDigits xs

findNextHighest _ n [] = n
findNextHighest n1 n2 (x:xs)
  | n1 > x && x > n2 = findNextHighest n1 x xs
  | otherwise = findNextHighest n1 n2 xs

replaceFirst _ _ [] = []
replaceFirst n1 n2 (x:xs)
  | x == n1 = n2:xs
  | otherwise = x : replaceFirst n1 n2 xs


solve ns [x] = ns ++ [x]
solve ns l@(x1:x2:xs)
  | x1 >= x2 && xh == -1 = solve (ns++[x1]) (x2:xs)
  | otherwise = rhs ++ rxs
  where
    xh = findNextHighest x2 (-1) (x1:ns)
    rhs = sort (replaceFirst xh x2 (x1:ns))
    rxs = replaceFirst x2 xh (x2:xs)

nextSmaller :: Integer -> Maybe Integer
nextSmaller x
  | x == x' || len x /= len x' = Nothing
  | otherwise = Just x'
  where
    len = length . toDigits
    x' = solve' x
    solve' = fromDigits . reverse . solve [] . reverse . toDigits
