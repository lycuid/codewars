import java.util.*;

public class Kata {
  public static long nextSmaller(long n) {
    ArrayList<Long> ns = toDigits(n);

    int size = ns.size();
    if (size == 1) { return -1; }

    long res = n;
    for (int j = size-1; j > 0; --j) {
      int i = j-1;
      if (ns.get(i) <= ns.get(j)) { continue; }

      int j2 = getNextHighestIndex(i, j, ns);
      if (j2 == -1) { continue; }

      swap(i, j2, ns);
      ns = sort_slice(j, ns);
      if (ns.get(0) != 0) { res = fromDigits(ns); }
      break;
    }
    return res == n ? -1 : res;    
  }
  
  
  public static int getNextHighestIndex(int index, int start, ArrayList<Long> ns) {
    int idx = -1;
    long max_so_far = -1;
    for (int i = start; i < ns.size(); ++i) {
      long current = ns.get(i);
      if (current < ns.get(index)) {
        if (current > max_so_far) {
          max_so_far = current;
          idx = i;
        }
      }
    }
    return idx;
  }


  public static ArrayList<Long> sort_slice(int start, ArrayList<Long> ns) {
    ArrayList<Long> res1 = new ArrayList<Long>();
    ArrayList<Long> res2 = new ArrayList<Long>();

    for (int i = 0; i < start; ++i) { res1.add(ns.get(i)); }
    
    for (int i = start; i < ns.size(); ++i) { res2.add(ns.get(i)); }

    Collections.sort(res2);
    Collections.reverse(res2);

    res1.addAll(res2);
    return res1;
  }


  public static ArrayList<Long> toDigits(long n) {
    ArrayList<Long> ns = new ArrayList<Long>();
    do {
      ns.add(0, n%10);
      n /= 10;
    } while (n > 0);
    return ns;
  }

  public static long fromDigits(ArrayList<Long> ns) {
    Long n = 0L;
    int s = ns.size();
    for (int i = 0; i < s; ++i) {
      n += ns.get(i) * (long)(Math.pow(10, s-i-1));
    }
    return n;
  }

  public static void swap(int i, int j, ArrayList<Long> ns) {
    long tmp = ns.get(i);
    ns.set(i, ns.get(j));
    ns.set(j, tmp);
  }
  
  public static boolean isEqual(ArrayList<Long> ns1, ArrayList<Long> ns2) {
    for (int i = 0; i < ns1.size(); ++i) {
      if (ns1.get(i) != ns2.get(i)) { return false; }
    }
    return true;
  }
}
