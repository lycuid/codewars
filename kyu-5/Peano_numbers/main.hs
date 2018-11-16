-- https://www.codewars.com/kata/5779b0f0ec883247b2000117
import Prelude hiding (even, odd, div, compare, Num, Int, Integer, Float, Double, Rational, Word)

data Peano = Zero | Succ Peano deriving (Eq, Show)

add, sub, mul, div :: Peano -> Peano -> Peano

add Zero Zero = Zero
add x Zero = x
add Zero x = x
add (Succ x) (Succ y) = Succ (Succ (add x y))


sub Zero Zero = Zero
sub (Succ x) Zero = Succ x
sub Zero (Succ x) = error "negative number"
sub (Succ x) (Succ y) = sub x y

mul Zero _ = Zero
mul _ Zero = Zero
mul (Succ x) (Succ Zero) = Succ x
mul (Succ x) (Succ y) = add (Succ x) $ mul (Succ x) (Succ y `sub` Succ Zero)

div _ Zero = error "divide by 0"
div Zero _ = Zero
div (Succ x) (Succ Zero) = Succ x
div (Succ x) (Succ y)
  | (Succ x) `compare` (Succ y) == LT = Zero
  | otherwise = (Succ Zero) `add` (div (Succ x `sub` Succ y) (Succ y))


even, odd :: Peano -> Bool

even Zero = True
even (Succ Zero) = False
even (Succ (Succ x)) = even x

odd = not . even


compare :: Peano -> Peano -> Ordering
compare Zero Zero = EQ
compare (Succ x) Zero = GT
compare Zero (Succ x) = LT
compare (Succ x) (Succ y) = compare x y

