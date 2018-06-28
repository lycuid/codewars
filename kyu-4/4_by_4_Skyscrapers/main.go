package main
import "fmt"

const INF int = 1e9
const GRAPH_SIZE int = 4

type Clue struct {
  value int
  x int
  y int
  isRow bool
}

func fill_2d_graph(fill_value int) [][]int {
  g := make([][]int, GRAPH_SIZE)
  for i := range g {
    g[i] = make([]int, GRAPH_SIZE)
    for j := 0; j < len(g[i]); j++ { g[i][j] = fill_value }
  }
  return g
}


func coordinates(i int) (int, int) {
  var x1 int = i / 4
  var y1 int = i % 4

  switch (x1) {
    case 0: return 0, y1
    case 1: return y1, GRAPH_SIZE-1
    case 2: return GRAPH_SIZE-1, GRAPH_SIZE-1-y1
    case 3: return GRAPH_SIZE-1-y1, 0
  }
  return -1, -1
}


func clue_blocks(cs []int) (clues []Clue) {
  for i := 0; i < len(cs); i++ {
    c := cs[i]
    if c != 0 {
      x, y := coordinates(i)
      isRow := ((i / GRAPH_SIZE) % GRAPH_SIZE) == 0
      clues = append(clues, Clue{value: c, x: x, y: y, isRow: isRow})
    }
  }
  return clues
}


func find_next_empty(g [][]int) (int, int) {
  for i := 0; i < GRAPH_SIZE; i++ {
    for j := 0; j < GRAPH_SIZE; j++ {
      if g[i][j] == INF { return i, j }
    }
  }
  return -1, -1
}

func in_row(k, x int, g [][]int) bool {
  for i := 0; i < GRAPH_SIZE; i++ {
    if g[x][i] == k { return true }
  }
  return false
}

func in_col(k, x int, g [][]int) bool {
  for i := 0; i < GRAPH_SIZE; i++ {
    if g[i][x] == k { return true }
  }
  return false
}

func satisfies_clues(k, x, y int, cbs []Clue, g [][]int) bool {
  for i := range cbs {
    cb := cbs[i]
    if cb.x == x && cb.y == y {
      v := cb.value
      if v == 1 || v == GRAPH_SIZE {
        return k == GRAPH_SIZE+1-v
      }



      /*

      // The Tricky Part

      if cb.isRow {

      } else {

      }

      */

    }
  }

  return false
}

func is_safe(k, x, y int, cbs []Clue, g [][]int) bool {
  return !in_row(k, x, g) && !in_col(k, y, g) && satisfies_clues(k, x, y, cbs, g)
}

func solve(cbs []Clue, g [][]int) bool {
  x, y := find_next_empty(g)
  if x == -1 && y == -1 { return true }
  for i := 1; i <= GRAPH_SIZE; i++ {
    if is_safe(i, x, y, cbs, g) {
      g[x][y] = i
      if solve(cbs, g) { return true }
      g[x][y] = INF
    }
  }
  return false
}

func solvePuzzle(cs []int) [][]int {
  cbs := clue_blocks(cs)

  g := fill_2d_graph(INF)
  if solve(cbs, g) { return g }
  fmt.Println("doesnt exist")
  return make([][]int, 4)
}

func main() {
  graph := solvePuzzle([]int{
    0, 0, 1, 2,
    0, 2, 0, 0,
    0, 3, 0, 0,
    0, 1, 0, 0,
  })

  fmt.Println(graph)
}




