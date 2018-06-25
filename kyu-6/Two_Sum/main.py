# https://www.codewars.com/kata/52c31f8e6605bcc646000082

def two_sum(numbers, target):
  for i, n1 in enumerate(numbers):
    for j, n2 in enumerate(numbers[i+1:]):
      if n1+n2 == target: return [i, i+j+1]
