-- https://www.codewars.com/kata/51f2d1cafc9c0f745c00037d/

solve _ [] = True
solve [] _ = False
solve (x : xs) (y : ys)
  | x == y = solve xs ys
  | otherwise = False

solution :: String -> String -> Bool
solution xs ys = solve (reverse xs) (reverse ys)
