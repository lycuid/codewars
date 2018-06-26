from itertools import combinations

def sides(points):
  [x1, y1], [x2, y2], [x3, y3] = points
  return [
    ((x2-x1)**2 + (y2-y1)**2),
    ((x3-x2)**2 + (y3-y2)**2),
    ((x1-x3)**2 + (y1-y3)**2),
  ]


def is_right_angled_triangle(points):
  s1, s2, s3 = sorted(sides(points), reverse=True)
  return s1 == (s2+s3)


def count_rect_triang(points):
  points_set = list(set(map(tuple, points)))
  count = 0
  for i in combinations(points_set, r=3):
    if is_right_angled_triangle(i): count+=1
  return count
