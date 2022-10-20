-- https://www.codewars.com/kata/5467e4d82edf8bbf40000155/
import Data.List (sort)

descendingOrder :: Integer -> Integer
descendingOrder = read . reverse . sort . show
