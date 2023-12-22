-- https://www.codewars.com/kata/515e271a311df0350d00000f/

squareSum :: [Integer] -> Integer
squareSum = sum . map (\x -> x * x)
