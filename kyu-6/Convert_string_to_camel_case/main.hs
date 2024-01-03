-- https://www.codewars.com/kata/517abf86da9663f1d2000003/

import Data.Char (toUpper)

toCamelCase :: String -> String
toCamelCase [] = []
toCamelCase ('-' : x : xs) = toUpper x : toCamelCase xs
toCamelCase ('_' : x : xs) = toUpper x : toCamelCase xs
toCamelCase (x : xs) = x : toCamelCase xs
