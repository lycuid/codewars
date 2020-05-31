-- https://www.codewars.com/kata/581e014b55f2c52bb00000f8/

import Data.Char (chr, isDigit)

decipher :: String -> String
decipher xs
  | null xs' = [ascii_char]
  | length xs' == 1 = ascii_char : xs'
  | length xs' == 2 = ascii_char : reverse xs'
  | otherwise = ascii_char : last xs' : (tail . init $ xs') ++ [head xs']
  where
    ascii_char = chr (read (takeWhile isDigit xs) :: Int)
    xs' = dropWhile isDigit xs

decipherThis :: String -> String
decipherThis = unwords . map decipher . words

