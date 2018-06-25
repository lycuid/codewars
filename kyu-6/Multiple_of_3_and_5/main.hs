-- https://www.codewars.com/kata/514b92a657cdc65150000006

solution :: Integer -> Integer
solution n = foldl1 (+) $ filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) [1..n-1]
