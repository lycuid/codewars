-- https://www.codewars.com/kata/54da5a58ea159efa38000836
import Data.List (sort, group)

findOdd :: [Int] -> Int
findOdd = head . head . filter (\l -> (mod (length l) 2) == 1) . group . sort
