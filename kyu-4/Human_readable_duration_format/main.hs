-- https://www.codewars.com/kata/52742f58faf5485cae000b9a/

import Data.List (intercalate)
import Data.Maybe (isNothing, fromJust)

formatDuration :: Integral i => i -> String
formatDuration n = humanReadable [seconds, minutes, hours, days, years]
  where
    (seconds, _) = toString "second" . divMod m $ 1
    (minutes, m) = toString "minute" . divMod h $ 60
    (hours, h) = toString "hour" . divMod d $ 3600
    (days, d) = toString "day" . divMod y $ (60 * 60 * 24)
    (years, y) = toString "year" . divMod n $ (60 * 60 * 24 * 365)

toString :: Integral i => String -> (i, i) -> (Maybe String, i)
toString s (i, j)
  | i == 0 = (Nothing, j)
  | i > 1 = (Just (num ++ " " ++ s ++ "s"), j)
  | otherwise = (Just (num ++ " " ++ s), j)
  where
    num = show . toInteger $ i

humanReadable :: [Maybe String] -> String
humanReadable lstr
  | len == 0 = "now"
  | len == 1 = head l
  | len == 2 = intercalate " and " . reverse $ l
  | otherwise = (intercalate ", " . reverse . tail $ l) ++ " and " ++ (head l)
  where
    l = map fromJust . filter (not . isNothing) $ lstr
    len = length l
