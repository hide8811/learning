public class TwoDimensionalArrayMultiplicationTable {
  public static void main(String[] args) {
    int[][] kuku = new int[9][9];

    for (int l = 0; l < 9; l++) {
      for (int r = 0; r < 9; r++) {
        kuku[l][r] = (l + 1) * (r + 1);
      }
    }

    for (int l = 0; l < 9; l++) {
      for (int r = 0; r < 9; r++) {
        System.out.printf(" %2d", kuku[l][r]); 
      }

      System.out.println();
    }
  }
}

