-- https://www.codewars.com/kata/585d7d5adb20cf33cb000235/haskell

getUnique :: [Int] -> Int
getUnique (x:xs) = if x `elem` xs then getUnique (xs ++ [x]) else x
