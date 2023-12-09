-- https://www.codewars.com/kata/52597aa56021e91c93000cb0/

moveZeros :: [Int] -> [Int]
moveZeros [] = []
moveZeros (0 : rest) = moveZeros rest ++ [0]
moveZeros (head : rest) = head : moveZeros rest
