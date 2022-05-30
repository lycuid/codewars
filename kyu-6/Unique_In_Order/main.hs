-- https://www.codewars.com/kata/54e6533c92449cc251001667/haskell
import           Data.List (concat, group)

uniqueInOrder :: Eq a => [a] -> [a]
uniqueInOrder = map head . group
