-- https://www.codewars.com/kata/5779b0f0ec883247b2000117
import Prelude hiding (even, odd, div, compare, Num, Int, Integer, Float, Double, Rational, Word)

data Peano = Zero | Succ Peano deriving (Eq, Show)

add, sub, mul, div :: Peano -> Peano -> Peano

add = apply (+)
sub = apply (-)
mul = apply (*)
 
div _ Zero = error "divide by 0"
div x y = apply quot x y


even, odd :: Peano -> Bool

even = isEven . detokenize
odd = not . isEven . detokenize

compare :: Peano -> Peano -> Ordering
compare x y
  | x' < y' = LT
  | x' > y' = GT
  | otherwise = EQ
  where
    [x', y'] = map detokenize [x, y]


isEven = (\x -> x `mod` 2 == 0)

apply f x y = tokenize . foldl1 f . map detokenize $ [x, y]

tokenize 0 = Zero
tokenize x
  | x < 0 = error "negative number"
  | otherwise = Succ (tokenize (x-1))

detokenize Zero = 0
detokenize (Succ x) = 1 + detokenize x
