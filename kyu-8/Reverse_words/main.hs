-- https://www.codewars.com/kata/51c8991dee245d7ddf00000e/

reverseWords :: String -> String
reverseWords = unwords . reverse . words
