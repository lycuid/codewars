-- https://www.codewars.com/kata/56efab15740d301ab40002ee

gcdi :: Integer -> Integer -> Integer
gcdi x 0 = x
gcdi 0 x = x
gcdi x y = gcd y1 (x1 `mod` y1)
  where
    x1 = maxi x y
    y1 = mini x y

lcmu :: Integer -> Integer -> Integer
lcmu x y = abs ((x * y) `div` gcdi x y)

som :: Integer -> Integer -> Integer
som = (+)

maxi :: Integer -> Integer -> Integer
maxi x y
  | x > y = x
  | otherwise = y

mini :: Integer -> Integer -> Integer
mini x y
  | x < y = x
  | otherwise = y

operArray :: (Integer -> Integer -> Integer) -> [Integer] -> Integer -> [Integer]
operArray _ [] i = []
operArray f (a:as) i = n : operArray f as n 
  where
    n = f a i
