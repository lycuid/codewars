import Data.List (sort, sortBy, group)
import Data.Function (on)
import Data.Char (toLower)

-- lenOrder :: Foldable f => f a -> f a -> Ordering
-- lenOrder x1 x2
--   | length x1 < length x2 = LT
--   | length x1 > length x2 = GT
--   | otherwise = EQ


-- greater :: Ord a => [a] -> [a] -> (Char, [a])
-- greater lx@(x:xs) ly@(y:ys)
--   | x > y = ('1', lx)
--   | x < y = ('2', ly)
--   | otherwise = ('=', lx)

-- longerOrGreater :: Ord a => [a] -> [a] -> (Char, [a])
-- longerOrGreater x1 x2
--   | x1Len == GT = ('1', x1)
--   | x1Len == LT = ('2', x2)
--   | otherwise = greater x1 x2
--   where
--     x1Len = lenOrder x1 x2 

-- solve :: [String] -> [String] -> [String]
-- solve xs  [] = map ((++) "1:") xs
-- solve [] ys = map ((++) "2:") ys
-- solve (x:xs) (y:ys)
--   | index == '1' = str ++ solve xs ys
--   | otherwise = str ++ solve xs ys
--   where
--     (index, value) = longerOrGreater x y
--     str = [index : ':' : value]


sortLengthThenLexi :: String -> String -> Ordering
sortLengthThenLexi x y
  | c == EQ = on compare (map toLower) x y
  | otherwise = c
  where
    c = on (flip compare) length x y

solve :: [String] -> [String]
solve l = sortBy sortLengthThenLexi l




grouping :: String -> String -> [String]
grouping index = map ((++) index)
               . filter (\x -> length x > 1)
               . group
               . sort
               . filter (\x -> x `elem` ['a'..'z'])

main :: IO ()
main = do
  let s1 = "my&friend&Paul has heavy hats! &"
  let s2 = "my friend John has many many friends &a"

  let l1 = grouping "1:" s1
  let l2 = grouping "2:" s2
  print l1
  print l2
  print . solve . (++) l1 $ l2
