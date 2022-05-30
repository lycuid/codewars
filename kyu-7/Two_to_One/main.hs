-- https://www.codewars.com/kata/5656b6906de340bd1b0000ac/haskell
import           Data.List (group, sort)

longest :: [Char] -> [Char] -> [Char]
longest s = map head . group . sort . (++) s
