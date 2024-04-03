-- https://www.codewars.com/kata/526571aae218b8ee490006f4/

countBits :: Int -> Int
countBits 0 = 0
countBits n = n `mod` 2 + countBits (n `div` 2)
