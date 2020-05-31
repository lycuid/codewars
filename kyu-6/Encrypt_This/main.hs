-- https://www.codewars.com/kata/5848565e273af816fb000449/

import Data.Char (ord)

encrypt :: String -> String
encrypt [] = []
encrypt [x] = show . ord $ x
encrypt [x, y] = (show . ord $ x) ++ [y]
encrypt (first:second:xs) = (show . ord $ first)
        ++ [last xs]
        ++ init xs
        ++ [second]

encryptThis :: String -> String
encryptThis = unwords . map encrypt . words
