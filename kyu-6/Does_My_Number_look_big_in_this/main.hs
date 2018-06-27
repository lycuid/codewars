-- https://www.codewars.com/kata/5287e858c6b5a9678200083c

total l = sum (map (\x -> x^n) l)
  where
    n = length l

numbers 0 = []
numbers x = numbers (x `div` 10) ++ [x `mod` 10]

narcissistic x = (total . numbers $ x) == x
