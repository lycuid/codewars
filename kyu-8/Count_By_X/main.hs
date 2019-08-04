-- https://www.codewars.com/kata/5513795bd3fafb56c200049e/

countBy :: Integer -> Int -> [Integer]
countBy x = reverse . steppedRange x


steppedRange :: Integer -> Int -> [Integer]
steppedRange x 0 = []
steppedRange x n = [x * (toInteger n)] ++ steppedRange x (n-1)