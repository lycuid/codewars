-- https://www.codewars.com/kata/595519279be6c575b5000016/
import Data.Char

battle :: String -> String -> String
battle xs ys
  | f xs < f ys = ys
  | f xs > f ys = xs
  | otherwise = "Tie!"
  where
    f = sum . map ord
