# https://www.codewars.com/kata/52fba66badcd10859f00097e

vowels = 'aeiou'
def disemvowel(string): return ''.join(x for x in string if x.lower() not in vowels)
