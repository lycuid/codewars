-- https://www.codewars.com/kata/54ff3102c1bad923760001f3/

getCount :: String -> Int
getCount = length . filter (`elem` "aeiou")
