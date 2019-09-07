-- https://www.codewars.com/kata/569d488d61b812a0f7000015/

dataReverse :: [Int] -> [Int]
dataReverse [] = []
dataReverse l = (++) (dataReverse . drop 8 $ l) (take 8 l)
