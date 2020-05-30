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

