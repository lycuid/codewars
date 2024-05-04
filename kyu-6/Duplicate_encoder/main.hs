-- https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/

import Data.Char (toLower)

duplicateEncode :: String -> String
duplicateEncode xs = map f xs
  where
    f x =
      if (length . filter (\y -> toLower y == toLower x) $ xs) == 1
        then '('
        else ')'
