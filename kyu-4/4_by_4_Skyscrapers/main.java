import java.util.List;
import java.util.ArrayList;

public class main {
  interface Condition {
    public boolean cc(int x);
  }

  public static final int GRAPH_SIZE = 4;

  private class Clue {
    private int value;
    private int x;
    private int y;
    private boolean is_col;
    private boolean reverse;

    public Clue(int value, int x, int y, boolean is_col, boolean reverse) {
      this.value = value;
      this.x = x;
      this.y = y;
      this.is_col = is_col;
      this.reverse = reverse;
    }
  }


  int[] coordinates(int i) {
    int x1 = i / GRAPH_SIZE;
    int y1 = i % GRAPH_SIZE;
    switch(x1) {
      case 0: return new int[] {0, y1};
      case 1: return new int[] {y1, GRAPH_SIZE-1};
      case 2: return new int[] {GRAPH_SIZE-1, GRAPH_SIZE-1-y1};
      case 3: return new int[] {GRAPH_SIZE-1-y1, 0};
    }
    return new int[] {-1, -1};
  }

  List<Clue> construct_clue_blocks(int[] cs) {
    List<Clue> cbs = new ArrayList<>();
    for (int i = 0; i < cs.length; ++i) {
      int c = cs[i];
      if (c == 0) { continue; }


      int[] coords = coordinates(i);
      int x = coords[0];
      int y = coords[1];
      boolean is_col = (int)(i / GRAPH_SIZE) % 2 == 0;
      boolean reverse = (is_col && x == GRAPH_SIZE) || (!is_col && y == GRAPH_SIZE);
      Clue clue = new Clue(c, x, y, is_col, reverse);
      cbs.add(clue);
    }
    return cbs;
  }

  int[] find_next_empty(int[][] g) {
    
    for (int i = 0; i < GRAPH_SIZE; ++i) {
      for (int j = 0; j < GRAPH_SIZE; ++j) {
        if (g[i][j] == 0) { return new int[] { i, j }; }
      }
    }
    return new int[] {-1, -1};
  }


  boolean in_row(int k, int x, int y, int[][] g) {
    for (int i = 0; i < GRAPH_SIZE; ++i) {
      if (i == y) { continue; }
      if (g[x][i] == k) { return true; }
    }
    return false;
  }

  boolean in_col(int k, int x, int y, int[][] g) {
    for (int i = 0; i < GRAPH_SIZE; ++i) {
      if (i == x) { continue; }
      if (g[i][y] == k) { return true; }
    }
    return false;
  }
  

  boolean is_valid(int k, int x, int y, int[][] g) {
    return !in_row(k ,x, y, g) && !in_col(k, x, y, g);
  }

  boolean satisfies_line(int max_visible, int[] a, boolean reverse) {
    int start = 1;
    int incremention = 1;
    int current = a[0];
    Condition c = (x) -> x < a.length;

    if (reverse) {
      start = a.length-2;
      incremention = -1;
      current = a[a.length-1];
      c = (x) -> x >= 0;
    }

    int visible_by_far = 0;
    if (current != 0) { visible_by_far = 1; }
    for (int i = start; c.cc(i); ++i) {
      if (a[i] > current) {
        visible_by_far++;
        current = a[i];
      }
    }
    if (count(0, a) == 0) {
      return visible_by_far == max_visible;
    } else {
      if (reverse) { return true; }
    }

    return visible_by_far <= max_visible;
  }

  boolean satisfies_clues(List<Clue> cbs, int[][] g) {
    for (Clue cb: cbs) {
      if (cb.value == 1 || cb.value == GRAPH_SIZE) {
        if (g[cb.x][cb.y] == GRAPH_SIZE-cb.value+1) { continue; }
      }
      int[] arr = new int[GRAPH_SIZE];
      if (cb.is_col) {
        for (int j = 0; j < GRAPH_SIZE; ++j) {
          arr[j] = g[j][cb.y];
        }
      } else { arr = g[cb.x]; }
      
      if (!satisfies_line(cb.value, arr, cb.reverse)) { return false; }
    }
    return true;
  }

  
  boolean fill_graph(List<Clue> cbs, int[][]g) {
    int[] coords = find_next_empty(g);
    int x = coords[0];
    int y = coords[1];
    if (x == -1 && y == -1) { return true; }

    for (int i = 1; i <= GRAPH_SIZE; ++i) {
      if (is_valid(i, x, y, g)) {
        g[x][y] = i;
        if (satisfies_clues(cbs, g)) {
          if (fill_graph(cbs, g)) { return true; }
        }
        g[x][y] = 0;
      }
    }

    return false;
  }


  public void add_known_clues(List<Clue> cbs, int[][] g) {
    for (Clue cb: cbs) {
      if (cb.value == 1) {
        g[cb.x][cb.y] = GRAPH_SIZE - cb.value + 1;
      }

      if (cb.value == GRAPH_SIZE) {
        int[] arr = make_range(1, GRAPH_SIZE-1);
        int start = 0;
        int incremention = 1;
        if (cb.reverse) {
          start = GRAPH_SIZE-1;
          incremention = -1;
        }

        for (int j = 0; j < GRAPH_SIZE; ++j) {
          int n = arr[start];
          if (cb.is_col) { g[j][cb.y] = n; }
          else { g[cb.x][j] = n; }
          start+=incremention;
        }
      }
    }
  }


  void SolvePuzzle(int[] cs) {
    List<Clue> cbs = construct_clue_blocks(cs);

    int[][] g = new int[GRAPH_SIZE][GRAPH_SIZE];

    fill_2d_graph(g);
    print_matrix(g);
    System.out.println();

    add_known_clues(cbs, g);
    print_matrix(g);
    System.out.println();
    
    fill_graph(cbs, g);
    print_matrix(g);
  }


  public static void main(String[] args) throws Exception {
    main p = new main();
    int[] cs = new int[] {
      0, 0, 1, 2,
      0, 2, 0, 0,
      0, 3, 0, 0,
      0, 1, 0, 0
    };
    p.SolvePuzzle(cs);
  }

  /*
   *
   * Helper functions, Remove later
   *
   */


  void print_matrix(int[][] g) {
    for (int i = 0; i < GRAPH_SIZE; ++i) {
      for (int j = 0; j < GRAPH_SIZE; ++j) {
        System.out.print(g[i][j] + " ");
      }
      System.out.println();
    }
  }

  void fill_2d_graph(int[][] g) {
    for (int i = 0; i < GRAPH_SIZE; ++i) {
      for (int j = 0; j < GRAPH_SIZE; ++j) {
        g[i][j] = 0;
      }
    }
  }


  int[] make_range(int start, int end) {
    int[] r = new int[end-start];
    for (int i = start; i < end; ++i) { r[i-start] = i; }
    return r;
  }


  int count(int key, int[] a) {
    int counter = 0;
    for (int i: a) {
      if (i == key) { ++counter; }
    }
    return counter;
  }

  void print_array(int[] a) {
    for (int i: a) {
      System.out.print(i + " ");
    }
  }

}


