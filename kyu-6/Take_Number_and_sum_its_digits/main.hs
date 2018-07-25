-- https://www.codewars.com/kata/5626b561280a42ecc50000d1

toDigits 0 = []
toDigits x = (toDigits $ x `div` 10) ++ [x `mod` 10]

f :: Int -> [Int]
f x 
  | g x == x = [x]
  | otherwise = []
  where
    g = sum . map (\(i, e) -> e^i) . zip [1..] . toDigits

solve [] = []
solve l@(x:xs) = f x ++ solve xs

sumDigPow x y = solve [x..y]
