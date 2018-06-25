-- https://www.codewars.com/kata/56b7f2f3f18876033f000307

isAscOrder :: [Int] -> Bool 
isAscOrder [] = True
isAscOrder [x] = True
isAscOrder (x1:x2:xs)
  | x1 <= x2 = isAscOrder (x2:xs)
  | otherwise = False
