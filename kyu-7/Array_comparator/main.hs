-- https://www.codewars.com/kata/561046a9f629a8aac000001d/

import Data.List (intersect)

matchList :: Eq a => [a] -> [a] -> Int
matchList xs = length . intersect xs
