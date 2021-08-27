public class MultiplicationTable {
  public static void main(String[] args) {
    int ans;

    System.out.println("   |  1   2   3   4   5   6   7   8   9 ");
    System.out.println("----------------------------------------");

    for (int l = 1; l < 10; l++) {
      System.out.print(" " + l + " |");

      for (int r = 1; r < 10; r++) {
        ans = l * r;
        System.out.printf(" %2d ", ans);
      }
      System.out.println();
    }
  }
}
