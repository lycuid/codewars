// https://www.codewars.com/kata/5a40fc7ce1ce0e34440000a3

#include <deque>

using namespace std;

typedef deque<int> D_INT;

D_INT to_array(int num)
{
  D_INT q;
  while (num) {
    q.push_front(num % 10);
    num /= 10;
  }
  return q;
}

bool is_dd(int n)
{
  D_INT nums = to_array(n);
  int a[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0};

  for (int i = 0; i < nums.size(); ++i) a[nums[i]] += 1;

  for (int i = 1; i < 9; ++i) {
    if (a[i] == i) return true;
  }

  return false;
}
