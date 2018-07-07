-- https://www.codewars.com/kata/5818c52e21a33314e00000cb

import Data.List (findIndices, sort)

indexOf :: (Eq a) => a -> [a] -> Int -> Int
indexOf _ [] _ = -1
indexOf e (x:xs) i 
  | e == x = i
  | otherwise = indexOf e xs (i+1)


unique :: (Eq a) => [a] -> [a]
unique [] = []
unique (x:xs) = x : (unique . filter (/=x) $ xs)


indices :: (Eq a) => [a] -> [a] -> [Int]
indices [] l = []
indices (u:us) l = (findIndices (==u) $ l) ++ (indices us l)

fromIndex :: [a] -> [Int] -> [a]
fromIndex l [] = []
fromIndex l (i:is) = (l !! i) : fromIndex l is

sortArrays :: [Int] -> [Int] -> ( [Int], [Int] )
sortArrays l1 l2 = (fromIndex l1 ls2 , fromIndex l2 ls1)
  where
    ls1 = indices (sort . unique $ l1) l1
    ls2 = indices (sort . unique $ l2) l2
