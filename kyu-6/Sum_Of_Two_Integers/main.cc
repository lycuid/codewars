// https://www.codewars.com/kata/5a9c35e9ba1bb5c54a0001ac/

int Add (int x, int y)
{
  if (y == 0) return x;
  else return Add(x ^ y, (x & y) << 1);
}