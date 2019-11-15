-- https://www.codewars.com/kata/585a8bd717cc9027e3000274/

exactLen :: Int -> [a] -> Bool
exactLen 0 [] = True
exactLen 0 xs = False
exactLen n [] = False
exactLen n (x:xs) = exactLen (n-1) xs

shortestList :: [[a]] -> [a]
shortestList [] = []
shortestList xs = fst . head . dropWhile ((==) False . snd) $ [ (x, f x) | f <- m, x <- xs]
  where
    m = (map exactLen [0..])

