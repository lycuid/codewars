-- https://www.codewars.com/kata/5779b0f0ec883247b2000117/

import Prelude hiding (even, odd, div, compare, Num, Int, Integer, Float, Double, Rational, Word)

data Peano = Zero | Succ Peano deriving (Eq, Show)

add, sub, mul, div :: Peano -> Peano -> Peano


add Zero Zero = Zero
add x Zero = x
add Zero x = x
add (Succ x) (Succ y) = Succ (Succ (add x y))

sub Zero Zero = Zero
sub x Zero = x
sub Zero x = error "negative number"
sub (Succ x) (Succ y) = sub x y

mul Zero _ = Zero
mul _ Zero = Zero
mul x (Succ Zero) = x
mul x y = add x . mul x . sub y $ (Succ Zero)

div _ Zero = error "divide by 0"
div Zero _ = Zero
div x (Succ Zero) = x
div x y 
  | compare x y == LT = Zero
  | otherwise = add (Succ Zero) . div (sub x y) $ y



even, odd :: Peano -> Bool

even Zero = True
even (Succ Zero) = False
even (Succ (Succ x)) = even x

odd = not . even

compare :: Peano -> Peano -> Ordering
compare Zero Zero = EQ
compare x Zero = GT
compare Zero x = LT
compare (Succ x) (Succ y) = compare x y

