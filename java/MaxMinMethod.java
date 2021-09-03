/*
最大・最小を求めるメソッド
*/

import java.util.Scanner;
import java.util.Arrays;

public class MaxMinMethod {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.println("数値を入力(半角スペース区切り)");
    String[] strNums = scanner.nextLine().split(" ");

    int[] numbers = Arrays.stream(strNums).mapToInt(Integer::parseInt).toArray();

    System.out.println("最大: " + MaxNum(numbers));
    System.out.println("最小: " + MinNum(numbers));
  }

  static int MaxNum(int[] numbers) {
    int max = numbers[0];

    for (int num: numbers) {
      if (max < num) {
        max = num;
      }
    }

    return max;
  }

  static int MinNum(int[] numbers) {
    int min = numbers[0];

    for (int num: numbers) {
      if (min > num) {
        min = num;
      }
    }

    return min;
  }
}
