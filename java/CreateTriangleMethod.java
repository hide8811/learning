/*
与えられた文字と大きさで三角形を作るメソッド
例)
サイズ: 3
文字: $

$
$$
$$$
*/

import java.util.Scanner;
import java.util.Collections;

public class CreateTriangleMethod {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.print("サイズ: ");
    int size = scanner.nextInt();

    System.out.print("文字: ");
    char pattern = scanner.next().charAt(0);

    createTriangle(size, pattern);
  }

  static void createTriangle(int size, char pattern) {
    for (int n = 1; n <= size; n++) {
      String side = String.join("", Collections.nCopies(n, String.valueOf(pattern)));
      System.out.println(side);
    }
  }
}
