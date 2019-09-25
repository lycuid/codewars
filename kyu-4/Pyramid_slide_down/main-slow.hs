-- https://www.codewars.com/kata/551f23362ff852e2ab000037

getHighestSum :: Int -> Int -> Int -> [[Int]] -> Int
getHighestSum sum _ _ [] = sum
getHighestSum sum minindex maxindex (x:xs) = max first second
  where
    first = getHighestSum (sum + (x !! minindex)) minindex (minindex + 1) xs
    second = getHighestSum (sum + (x !! maxindex)) maxindex (maxindex + 1) xs

longestSlideDown :: [[Int]] -> Int
longestSlideDown (x:xs) = getHighestSum (head x) 0 1 xs

