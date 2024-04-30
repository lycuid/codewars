-- https://www.codewars.com/kata/545cedaa9943f7fe7b000048/

import Data.Char (isAsciiLower, toLower)
import Data.List (group, sort)

isPangram :: String -> Bool
isPangram =
  (== 26)
    . length
    . group
    . sort
    . filter isAsciiLower
    . map toLower
