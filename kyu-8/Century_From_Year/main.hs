-- https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097

century::Int -> Int
century year = c + (if year `mod` 100 == 0 then 0 else 1)
	where
		c = year `div` 100

