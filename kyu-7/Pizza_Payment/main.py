-- https://www.codewars.com/kata/5b043e3886d0752685000009

def michael_pays(c):
  if c < 5: return c if int(c) == c else float('%.2f'%c) 
  c = c - min(c/3, 10)
  return c if int(c) == c else float('%.2f'%c)  
