-- https://www.codewars.com/kata/51675d17e0c1bed195000001/

solve :: String -> [Int]
solve xs
  | length xs <= 5 = [read xs :: Int]
  | otherwise = (read . take 5 $ xs :: Int) : (solve . tail $ xs)

digit5 :: String -> Int
digit5 = maximum . solve

