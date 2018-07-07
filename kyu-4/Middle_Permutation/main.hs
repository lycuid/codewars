qsort [] = []
qsort [x] = [x]
qsort (x:xs) = (qsort . lesser $ xs) ++ [x] ++ (qsort . greater $ xs)
  where
    greater = filter (>=x)
    lesser = filter (<x)

fact :: Int -> Int
fact n = foldl (*) 1 [1..n]

permutes :: (Eq a) => [a] -> [[a]]
permutes [] = [[]]
permutes l = [a:x | a <- l, x <- (permutes $ filter (\x -> x /= a) l)]


middlePermutation :: String -> String
middlePermutation s = a
  where
    n = (ps `div` 2) + (ps `mod` 2)
    ps = fact len
    len = length s
    a:as = drop (n-1) . take n . permutes . qsort $ s
