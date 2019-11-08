-- https://www.codewars.com/kata/5ce399e0047a45001c853c2b

f _ [] = []
f s (x:xs) =  diff : f diff xs
  where
    diff = (-) s x

partsSum :: [Integer] -> [Integer]
partsSum xs = s : f s xs
  where
    s = sum xs
