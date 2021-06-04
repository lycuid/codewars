-- https://www.codewars.com/kata/526e8de0512511429e000006/
--
import Data.Char (isSpace)

trim :: String -> String
trim = reverse . dropWhile isSpace . reverse . dropWhile isSpace
