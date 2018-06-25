// https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097

#include <math.h>

int centuryFromYear(int year) 
{
  return floor(year/100) + (year%100 ? 1 : 0);
}