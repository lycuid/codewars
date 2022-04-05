-- https://www.codewars.com/kata/51ba717bb08c1cd60f00002f/
import Data.List (intercalate)

solution :: [Integer] -> String
solution [] = ""
solution n = str ++ (if (length l) > 0 then ',':next else next)
  where
    next = solution l
    (str, l) = takeWhileInRange [] n

takeWhileInRange :: [Integer] -> [Integer] -> (String, [Integer])
takeWhileInRange l [] = (toString l, [])
takeWhileInRange [] (x:xs) = takeWhileInRange [x] xs
takeWhileInRange l x'@(x:xs)
  | (last l) == (x - 1) = takeWhileInRange (l ++ [x]) xs
  | otherwise = (toString l, x')

toString :: [Integer] -> String
toString [] = ""
toString [x] = show x
toString l@[x, y] = intercalate "," . map show $ l
toString l = intercalate "-" . map show $ [head l, last l]
