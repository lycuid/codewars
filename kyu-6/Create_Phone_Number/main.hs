-- https://www.codewars.com/kata/525f50e3b73515a6db000b83

createPhoneNumber :: [Int] -> String
createPhoneNumber s = concat (["("] ++ country s ++ [") "] ++ city s ++ ["-"] ++ local s)
  where
    country = map show . take 3
    city = map show . take 3 . drop 3
    local = map show . drop 6
