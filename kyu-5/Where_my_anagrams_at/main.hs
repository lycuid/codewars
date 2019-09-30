-- https://www.codewars.com/kata/523a86aa4230ebb5420001e1/

import Data.List (sort)

anagrams :: String -> [String] -> [String]
anagrams w = filter (\x -> (==) (sort w) (sort x))
