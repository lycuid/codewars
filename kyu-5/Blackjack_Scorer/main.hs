import Data.List (partition)
import Data.Char (isDigit)


blackjackScore :: String -> Int
blackjackScore x
  | isNumber x = read x :: Int
  | otherwise = 10
  where
    isNumber = isDigit . head

blackjackSafeScore :: [String] -> (Int, Int)
blackjackSafeScore xs = (length aces, safe_score)
  where
    (aces, rest) = partition ((==) "A") xs
    safe_score = (+) (length aces) . sum . map blackjackScore $ rest

scoreHand :: [String] -> Int
scoreHand xs = safe_score + required_score
  where
    (ace_len, safe_score) = blackjackSafeScore xs
    required_score = (*) 10 . min ace_len . max 0 $ ((21 - safe_score) `div` 10)

