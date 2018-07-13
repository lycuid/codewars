// https://www.codewars.com/kata/5671d975d81d6c1c87000022
package main
import "fmt"
const GRAPH_SIZE int = 4
type Clue struct {
  value int
  x int
  y int
  is_col bool
  reverse bool
}

func make_range(start, end int) []int {
  r := make([]int, 0)
  for i := start; i < end; i++ {
    r = append(r, i)
  }
  return r
}

func count(key int, a []int) int {
  count := 0
  for i := 0; i < len(a); i++ {
    if a[i] == key { count+=1 }
  }
  return count
}

func fill_2d_graph() [][]int {
  g := make([][]int, GRAPH_SIZE)
  for i := range g {
    g[i] = make([]int, GRAPH_SIZE)
  }
  return g
}

func coordinates(i int) (int, int) {
  var x1 int = i / GRAPH_SIZE
  var y1 int = i % GRAPH_SIZE
  switch (x1) {
    case 0: return 0, y1
    case 1: return y1, GRAPH_SIZE-1
    case 2: return GRAPH_SIZE-1, GRAPH_SIZE-1-y1
    case 3: return GRAPH_SIZE-1-y1, 0
  }
  return -1, -1
}

func construct_clue_blocks(cs []int) (clues []Clue) {
  for i := 0; i < len(cs); i++ {
    c := cs[i]
    if c != 0 {
      x, y := coordinates(i)
      is_col := (int(i / GRAPH_SIZE) % 2) == 0
      reverse := (is_col && x == GRAPH_SIZE-1) || (!is_col && y == GRAPH_SIZE-1)
      clues = append(clues,
        Clue{
          value: c,
          x: x,
          y: y,
          is_col: is_col,
          reverse: reverse,
      })
    }
  }
  return clues
}

func find_next_empty(g [][]int) (int, int) {
  for i := 0; i < GRAPH_SIZE; i++ {
    for j := 0; j < GRAPH_SIZE; j++ {
      if g[i][j] == 0 { return i, j }
    }
  }
  return -1, -1
}

func in_row(k, x, y int, g [][]int) bool {
  for i := 0; i < GRAPH_SIZE; i++ {
    if i == y { continue }
    if g[x][i] == k { return true }
  }
  return false
}

func in_col(k, x, y int, g [][]int) bool {
  for i := 0; i < GRAPH_SIZE; i++ {
    if i == x { continue }
    if g[i][y] == k { return true }
  }
  return false
}

func is_valid(k, x, y int, g [][]int) bool {
  return !in_row(k, x, y, g) && !in_col(k, x, y, g)
}

func satisfies_line(max_visible int, a []int, reverse bool) bool {
  start, incremention, current := 1, 1, a[0]
  condition := func(x int) bool { return x < len(a) }
  if reverse {
    start, incremention, current = len(a)-2, -1, a[len(a)-1]
    condition = func(x int) bool { return x >= 0 }
  }
  visible_by_far := 0
  if current != 0 { visible_by_far = 1 }
  for i := start; condition(i); i+=incremention {
    if a[i] > current {
      visible_by_far += 1
      current = a[i]
    }
  }
  zero_count := count(0, a)
  if zero_count == 0 {
    return visible_by_far == max_visible
  } else {
    if reverse { return true }
  }

  return visible_by_far <= max_visible

}

func satisfies_clues(cbs []Clue, g [][]int) bool {
  for i := range cbs {
    cb := cbs[i]
    if cb.value == 1 || cb.value == GRAPH_SIZE {
      if g[cb.x][cb.y] == GRAPH_SIZE-cb.value+1 { continue }
    }
    arr := make([]int, 0)
    if cb.is_col {
      for j := 0; j < GRAPH_SIZE; j++ {
        arr = append(arr, g[j][cb.y])
      }
    } else { arr = g[cb.x] }
    if !satisfies_line(cb.value, arr, cb.reverse) { return false }
  }
  return true
}

func fill_graph(cbs []Clue, g [][]int) bool {
  x, y := find_next_empty(g)
  if x == -1 && y == -1 { return true }

  for i := 1; i <= GRAPH_SIZE; i++ {
    if is_valid(i, x, y, g) {
      g[x][y] = i
      if satisfies_clues(cbs, g) {
        if fill_graph(cbs, g) { return true }
      }
      g[x][y] = 0
    }
  }
  return false
}

func add_known_clues(cbs []Clue, g [][]int) {
  for i := range cbs {
    cb := cbs[i]
    if cb.value == 1 {
      g[cb.x][cb.y] = GRAPH_SIZE - cb.value + 1
    }
    if cb.value == GRAPH_SIZE {
      arr := make_range(1, GRAPH_SIZE+1)
      start, incremention := 0, 1
      if cb.reverse { start, incremention = GRAPH_SIZE-1, -1 }
      for j := 0; j < GRAPH_SIZE; j++ {
        n := arr[start]
        if cb.is_col {
          g[j][cb.y] = n
        } else {
          g[cb.x][j] = n
        }
        start += incremention
      }
    }
  }
}

func SolvePuzzle(cs []int) [][]int {
  cbs := construct_clue_blocks(cs)
  g := fill_2d_graph()
  add_known_clues(cbs, g)
  fill_graph(cbs, g)
  return g
}

