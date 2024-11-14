-- https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/
import Data.List
import Data.Char

duplicateCount :: String -> Int
duplicateCount = length . filter (>1) . map length . group . sort . map toLower
