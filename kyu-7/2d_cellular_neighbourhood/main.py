def get_neighbourhood(n_type, arr, coordinates):
  x, y = coordinates
  r, c = len(arr), len(arr[0])
  if 0 > x or x >= r or 0 > y or y >= c: return []
  if n_type == "moore":
    return [
      arr[i][j]
      for i in range(x-1 if x > 0 else x, x+2 if x < r-1 else x+1)
      for j in range(y-1 if y > 0 else y, y+2 if y < c-1 else y+1)
      if (i, j) != (x, y)
    ]

  return [
    arr[c1][c2]
    for i in (-1, 1)
    for c1, c2 in [(x+i, y), (x, y+i)]
    if c1 >= 0 and c2 >= 0 and c1 < r and c2 < c
  ]

