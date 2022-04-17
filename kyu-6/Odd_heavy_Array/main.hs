-- https://www.codewars.com/kata/59c7e477dcc40500f50005c7/
import           Control.Applicative
import           Data.Bool           (bool)

isOddHeavy :: [Int] -> Bool
isOddHeavy = uncurry (>) . foldl collect (Nothing, Nothing)
  where
    collect (o, e) x =
      bool (min x <$> o <|> pure x, e) (o, max x <$> e <|> pure x) (x `mod` 2 == 0)
