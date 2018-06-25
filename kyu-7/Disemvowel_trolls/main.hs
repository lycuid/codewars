-- https://www.codewars.com/kata/52fba66badcd10859f00097e

vowels :: String
vowels = "aeiouAEIOU"

disemvowel :: String -> String
disemvowel = filter (`notElem` vowels)
