-- https://www.codewars.com/kata/5259b20d6021e9e14c0010d4/
import Data.List.Split

reverseWords :: String -> String
reverseWords = unwords . map reverse . splitOn " "
