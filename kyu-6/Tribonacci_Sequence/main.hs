-- https://www.codewars.com/kata/556deca17c58da83c00002db/

tribonacci :: Num a => (a, a, a) -> Int -> [a]
tribonacci (a, b, c) n = take n $ tribo (a, b, c)
  where
    tribo (a, b, c) = a : tribo (b, c, a + b + c)
