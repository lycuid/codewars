-- https://www.codewars.com/kata/550f22f4d758534c1100025a/

data Direction = North | East | West | South deriving (Eq)

dirReduce :: [Direction] -> [Direction]
dirReduce =
  reverse
    . foldl
      ( \xs x -> case (xs, x) of
          (North : rest, South) -> rest
          (East : rest, West) -> rest
          (West : rest, East) -> rest
          (South : rest, North) -> rest
          _ -> x : xs
      )
      []
