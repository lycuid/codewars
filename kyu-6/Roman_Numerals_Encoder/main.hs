-- https://www.codewars.com/kata/51b62bf6a9c58071c600001b/

import qualified Data.Map.Strict as M

numberMap :: M.Map Integer String
numberMap = M.fromList  [ (0, "")
                        , (1, "I")
                        , (4, "IV")
                        , (5, "V")
                        , (9, "IX")
                        , (10, "X")
                        , (40, "XL")
                        , (50, "L")
                        , (90, "XC")
                        , (100, "C")
                        , (400, "CD")
                        , (500, "D")
                        , (900, "CM")
                        , (1000, "M")
                        ]

keys = reverse $ M.keys numberMap

splitNumber :: Integer -> [Integer]
splitNumber n
  | n `elem` keys = [n]
  | otherwise = number : splitNumber (n - number)
  where
    number = head . dropWhile (> n) $ keys

splitUnit :: Integer -> Integer -> [Integer]
splitUnit _ 0 = []
splitUnit index n = next ++ splitNumber number
  where
    next  = splitUnit (index + 1) (n `div` 10)
    number = (n `mod` 10) * (10 ^ index)

solution :: Integer -> String
solution n = concat . map ((M.!) numberMap) . splitUnit 0 $ n

