-- https://www.codewars.com/kata/55466989aeecab5aac00003e

sort' :: Int -> Int -> [Int]
sort' x y
  | x > y = [y, x]
  | otherwise = [x, y]

getNumberOfSquares :: Int -> Int -> [Int]
getNumberOfSquares 0 _ = []
getNumberOfSquares x y = (take n . cycle $ [x]) ++ (getNumberOfSquares (y `mod` x) x)
  where
    n = y `div` x

squaresInRect :: Int -> Int -> Maybe [Int]
squaresInRect x y
  | x == y = Nothing
  | otherwise = Just (getNumberOfSquares x' y')
  where
    [x', y'] = sort' x y

