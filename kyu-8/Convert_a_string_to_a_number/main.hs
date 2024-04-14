-- https://www.codewars.com/kata/544675c6f971f7399a000e79/

stringToNumber :: String -> Integer
stringToNumber ('-' : xs) = -1 * stringToNumber xs
stringToNumber xs = foldl (\a ch -> a * 10 + read (pure ch)) 0 xs
