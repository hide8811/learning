/*
平均値を出すメソッド
小数点以下は切り捨て
*/

import java.util.Scanner;
import java.util.Arrays;

public class AverageMethod {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.print("数値を入力(半角スペース区切り): ");
    String[] strNums = scanner.nextLine().split(" ");
    int[] numbers = Arrays.stream(strNums).mapToInt(Integer::parseInt).toArray();

    System.out.println("平均: " + average(numbers));
  }

  static int average(int[] numbers) {
    int avr = 0;

    for (int num: numbers) {
      avr += num;
    }

    return avr / numbers.length;
  }
}
