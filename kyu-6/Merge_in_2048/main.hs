-- https://www.codewars.com/kata/55e1990978c60e5052000011

shift :: [Int] -> [Int]
shift [] = []
shift [x] = [x]
shift (x1:x2:xs)
  | x1 == x2 = x1+x2 : shift xs
  | otherwise = x1: shift (x2:xs)


filterAndShift :: [Int] -> [Int]
filterAndShift = shift . filter (/=0)

merge :: [Int] -> [Int]
merge s = ss ++ zeros
  where
    ss = filterAndShift s
    zeros = [0 | n <- [0 .. ((length s) - 1 - length ss)]]
