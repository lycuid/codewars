-- https://www.codewars.com/kata/598106cb34e205e074000031

countDeafRats :: String -> Int
countDeafRats ""           = 0
countDeafRats ('P':xs)     = countDeafRats (reverse xs)
countDeafRats ('O':'~':xs) = 1 + countDeafRats xs
countDeafRats ('~':'O':xs) = countDeafRats xs
countDeafRats (_:xs)       = countDeafRats xs
