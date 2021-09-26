-- https://www.codewars.com/kata/52b7ed099cdc285c300001cd

type IntPair = (Int, Int)

quicksort :: [IntPair] -> [IntPair]
quicksort [] = []
quicksort [x] = [x]
quicksort (p@(p1, _):xs) = quicksort smaller ++ [p] ++ quicksort larger
  where
    smaller = filter ((< p1) . fst) xs
    larger = filter ((> p1) . fst) xs

accumulateOverlapping :: [IntPair] -> IntPair -> [IntPair]
accumulateOverlapping [] pair = [pair]
accumulateOverlapping (pair1@(x1, x2):xs) pair2@(y1, y2)
  | mergable pair1 pair2 = (min x1 y1, max x2 y2) : xs
  | otherwise = pair1 : accumulateOverlapping xs pair2
  where
    mergable p1 p2 = fst p2 < snd p1

sumOfIntervals :: [IntPair] -> Int
sumOfIntervals = foldl pairSum 0 . foldl accumulateOverlapping [] . quicksort
  where
    pairSum acc (p1, p2) = acc + (p2 - p1)
