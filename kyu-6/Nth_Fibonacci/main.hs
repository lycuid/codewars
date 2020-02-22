-- https://www.codewars.com/kata/522551eee9abb932420004a0/

fib :: Int -> Int
fib n = last . take n $ f
  where
    f = 0 : 1 : zipWith (+) f (tail f)
