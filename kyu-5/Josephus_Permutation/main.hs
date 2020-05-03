-- https://www.codewars.com/kata/5550d638a99ddb113e0000a2/

splitOn :: Int -> [a] -> [[a]]
splitOn k xs
  | k < 0 = [[], [], xs]
  | k >= length xs = [xs, [], []]
  | otherwise = [previous, [object], next]
  where
    (previous, (object:next)) = splitAt k xs

josephus :: [a] -> Int -> [a]
josephus [] _ = []
josephus [x] _ = [x]
josephus xs k
  | k <= len = object : josephus (next ++ previous) k
  | otherwise = mod_object : josephus (mod_next ++ mod_previous) k
  where
    len = length xs
    [previous, [object], next] = splitOn (k-1) xs
    [mod_previous, [mod_object], mod_next] = splitOn mod' xs
    mod' = if mod k len == 0
              then len - 1
              else (mod k len) - 1

