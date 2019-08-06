-- https://www.codewars.com/kata/59c633e7dcc4053512000073/

import Data.Char (ord)

solve :: String -> Int
solve = maximum . clean . map (\x -> (-) x 96) . map ord . map removeVowels

removeVowels :: Char -> Char
removeVowels x
  | x `elem` "aeiou" = '`'
  | otherwise = x

clean :: [Int] -> [Int]
clean [] = []
clean l = [non_zero_sum] ++ (clean remaining)
  where
    non_zero_sum = sum . takeWhile (/=0) $ l
    remaining = dropWhile (==0) . dropWhile (/=0) $ l
