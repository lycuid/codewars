-- https://www.codewars.com/kata/5208f99aee097e6552000148/

import Data.Char (isAsciiUpper)

solution :: String -> String
solution = reverse . foldl f ""
  where
    f xs x
      | isAsciiUpper x = x : ' ' : xs
      | otherwise = x : xs
