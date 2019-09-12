-- https://www.codewars.com/kata/5902f769dbf4ccbdd900005d/

data Point = Point (Int, Int)

instance Show Point where
  show (Point (a, b)) = "(" ++ show a ++ " " ++ show b ++ ")"

instance Num Point where
  -- just need addition and subtraction here.
  (+) (Point (a, a')) (Point (b, b')) = Point (a + b, a' + b')
  (-) (Point (a, a')) (Point (b, b')) = Point (a - b, a' - b')

  (*) = undefined
  signum = undefined
  abs = undefined
  fromInteger = undefined


getWall :: Int -> Int -> Int -> Int 
getWall size steps wall
  -- This shouldn't happen.
  | wall > 4 = error "something's wrong, the force is weak with this one."

  | steps >= previouswall && steps <= currentwall = wall
  | otherwise = getWall size steps (wall + 1)
  where
    currentwall = (wall * size) - (wall - 1)
    previouswall = ((wall-1) * size) - (wall - 2)


position :: Point -> Int -> Int -> Point
position (Point p) size steps
  | wall == 1 = Point p + Point (1, steps)
  | wall == 2 = Point p + Point ((steps - size) + 1, size)
  | wall == 3 = Point p + Point (size, (3 * size) - 1 - steps)
  | otherwise = Point p + Point ((4 * size - 2 - steps), 1)
  where
    wall = getWall size steps 1

wallSize :: Int -> Int
wallSize 1 = 1
wallSize size = (*) 4 . (-) size $ 1


finalPosition :: Point -> Int -> Int -> Point
finalPosition (Point p) size steps
  | steps > walkable = finalPosition nextPoint (size - 2) remainingSteps
  | otherwise = position (Point p) size steps
  where
    nextPoint = Point p + Point (1, 1)
    remainingSteps = steps - walkable
    walkable = wallSize size


blindfolded :: Int -> Int -> (Int, Int)
blindfolded s = toCoordindates . finalPosition (Point (-1, -1)) s
  where
    toCoordindates (Point a) = a



