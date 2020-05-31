-- https://www.codewars.com/kata/521c2db8ddc89b9b7a0000c1/
--
snail :: [[Int]] -> [Int]
snail [] = []
snail [x] = x
snail box = head box
          ++ [last x | x <- center]
          ++ (reverse . last $ box)
          ++ reverse [head y | y <- center]
          ++ snail c
  where
    center = tail . init $ box
    c = map (tail . init) . tail . init $ box

