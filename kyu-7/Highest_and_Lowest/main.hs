-- https://www.codewars.com/kata/554b4ac871d6813a03000035/
import Data.List (sort)

highAndLow :: String -> String
highAndLow = unwords . map show . fn . sort . map (read :: String -> Int) . words
  where
    fn xs = [last xs, head xs]
