-- https://www.codewars.com/kata/5715eaedb436cf5606000381/

positiveSum :: [Int] -> Int
positiveSum = sum . filter (> 0)
