-- https://www.codewars.com/kata/515de9ae9dcfc28eb6000001
solution :: String -> [String]
solution [] = []
solution [x] = [x : "_"]
solution (x1 : x2 : xs) = [x1, x2] : solution xs
