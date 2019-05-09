-- https://www.codewars.com/kata/550554fd08b86f84fe000a58
import Data.List (sort)
import Data.Set (toList, fromList)
import qualified Data.Text as T

-- converting to set and back.
-- A pythonic approach, I suppose (not everyone is perfect).
-- may change the order of the list.
uniquify :: Ord a => [a] -> [a]
uniquify = toList . fromList

isSubStr :: String -> [String] -> Bool
isSubStr str = or . map (\x -> T.isInfixOf (T.pack str) (T.pack x))

inArray :: [String] -> [String] -> [String]
inArray l1 l2 = sort . uniquify . filter (\x -> isSubStr x l2) $ l1
