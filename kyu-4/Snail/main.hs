middle :: [a] -> a
middle l = head . take 1 . drop len $ l
  where
    len = div (length l) 2

getPath _ 0 = []
getPath l 1 = [middle . middle $ l]
getPath grid size = foldl (++) [] [ wall1
                                  , wall2
                                  , wall3
                                  , wall4
                                  , getPath grid (size - 2)
                                  ]
  where
    wall1 = size + take l - 2
    wall2 = [] -- wall2
    wall3 = [] -- wall3
    wall4 = [] -- wall4
    l = length grid
