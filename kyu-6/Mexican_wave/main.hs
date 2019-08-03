-- https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/

import Data.Char (toUpper)

wave :: String -> [String]
wave = solve ""

solve :: String -> String -> [String]
solve s [] = []
solve s (' ':xs) = solve (s ++ [' ']) xs
solve s (x:xs) = c ++ (solve (s ++ [x]) xs)
  where
    c = [s ++ [toUpper x] ++ xs]
