-- https://www.codewars.com/kata/56747fd5cb988479af000028/train/

getMiddle :: String -> String
getMiddle s = if length s <= 2 then s else getMiddle . init . tail $ s
