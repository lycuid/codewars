-- https://www.codewars.com/kata/5a045fee46d843effa000070

factorial :: (Eq a, Num a) => a -> a
factorial 0 = 1
factorial n = n * factorial(n-1)

prime_factors :: Integral a => a -> [a]
prime_factors n =
  case factors of
    [] -> [n]
    _  -> factors ++ prime_factors (n `div` (head factors))
  where factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. n-1]

count :: Eq a => a -> [a] -> Int
count x xs = length $ filter (==x) xs

set :: Eq a => [a] -> [a]
set [] = []
set (x:xs)
  | flip elem xs x = set xs
  | otherwise = x : set xs

foldWithStar x y = x ++ " * " ++ y

d_string x f
  | c <= 1 = show x
  | otherwise = show x ++ "^" ++ show c
  where
    c = count x f

decomp n = foldl1 foldWithStar (map (\x -> d_string x factors) unique_factors)
  where
    unique_factors = set factors
    factors = prime_factors . factorial $ n
