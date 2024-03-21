-- https://www.codewars.com/kata/5583090cbe83f4fd8c000051/

digitize :: Int -> [Int]
digitize s = m : if d > 0 then digitize d else []
  where
    (d, m) = s `divMod` 10
