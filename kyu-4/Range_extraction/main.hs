-- https://www.codewars.com/kata/51ba717bb08c1cd60f00002f/

import Data.List (intercalate)

solution :: [Int] -> String
solution [] = ""
solution n = str ++ (if (length l) > 0 then ',':next else next)
  where
    next = solution l
    (str, l) = takeWhileInRange [] n

takeWhileInRange :: [Int] -> [Int] -> (String, [Int])
takeWhileInRange l [] = (toString l, [])
takeWhileInRange [] (x:xs) = takeWhileInRange [x] xs
takeWhileInRange l x'@(x:xs)
  | (last l) == (x - 1) = takeWhileInRange (l ++ [x]) xs
  | otherwise = (toString l, x')

toString :: [Int] -> String
toString [] = ""
toString [x] = show x
toString l@[x, y] = intercalate "," . map show $ l
toString l = intercalate "-" . map show $ [head l, last l]

lst :: [Int]
lst = [-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]

