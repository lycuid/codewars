-- https://www.codewars.com/kata/56541980fa08ab47a0000040

errors :: Int -> [Char] -> Int
errors n [] = n
errors n (x:xs)
  | x >= 'a' && x <= 'm' = errors n xs
  | otherwise = errors (n+1) xs

printerError :: [Char] -> [Char]
printerError s = (show (errors 0 s)) ++ "/" ++ (show .length $ s)
