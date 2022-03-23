-- https://www.codewars.com/kata/5629db57620258aa9d000014/
import Data.Char (isLower)
import Data.List (group, intercalate, sort, sortBy)

data Mix  = Mix
          { identifier :: Char
          , value      :: Char
          , count      :: Int
          }

instance Show Mix where
  show (Mix i v c) = i : ':' : (take c $ repeat v)

instance Eq Mix where
  Mix {value = v1} == Mix {value = v2} = v1 == v2

instance Ord Mix where
  Mix {value = v1} `compare` Mix {value = v2} = v1 `compare` v2

merge :: Mix -> Mix -> Mix
merge (Mix i1 v1 c1) (Mix i2 v2 c2) = Mix i v1 (max c1 c2)
  where
    i | c1 > c2 = i1
      | c1 < c2 = i2
      | otherwise = '='

count_lexical :: Mix -> Mix -> Ordering
count_lexical m1 m2
  | cmp == EQ = show m1 `compare` show m2
  | otherwise = cmp
  where
    cmp = count m2 `compare` count m1

mix :: [Char] -> [Char] -> [Char]
mix s1 s2 = intercalate "/"
          . map show
          . sortBy count_lexical
          . map (foldl1 merge)
          . group
          . sort
          $ toMix '1' s1 ++ toMix '2' s2
  where
    toMix :: Char -> String -> [Mix]
    toMix i = map (Mix i . head <*> length)
        . filter ((> 1) . length)
        . group
        . sort
        . filter isLower
