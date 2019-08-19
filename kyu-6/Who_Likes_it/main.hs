-- https://www.codewars.com/kata/5266876b8f4bf2da9b000362/

import Data.List (intercalate)

joinSpace :: [String] -> String
joinSpace = intercalate " "

likes :: [String] -> String
likes []         = "no one likes this"
likes [x]        = joinSpace [x, "likes this"]
likes [x, y]     = joinSpace [x, "and", y, "like this"]
likes [x, y, z]  = joinSpace [x ++ ",", y, "and", z, "like this"]
likes (x:y:rest) = joinSpace [x ++ ",", y, "and", (show . length $ rest), "others", "like this"]