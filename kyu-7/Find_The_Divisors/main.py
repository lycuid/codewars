# https://www.codewars.com/kata/544aed4c4a30184e960010f4

def divisors(n):
  lst = [x for x in range(2, (n>>1)+1) if not n%x]
  return lst or '%d is prime'%n
