-- https://www.codewars.com/kata/57ebdf1c2d45a0ecd7002cd5

inOutReverse :: String -> String
inOutReverse xs = drop ceil rxs ++ pivot ++ take l rxs
  where
    rxs = reverse xs
    l = length xs `div` 2
    ceil = ceiling ((fromIntegral . length $ xs) / 2)
    pivot = drop l (take ceil rxs)
    
insideOut :: String -> String
insideOut = unwords . map inOutReverse . words
