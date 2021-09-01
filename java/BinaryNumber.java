import java.util.Scanner;
import java.util.InputMismatchException;
import java.util.Arrays;
import java.util.stream.Collectors;

public class BinaryNumber {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    int num = 0;
    boolean flag = true;

    System.out.println("整数値を入力してください:");

    while (flag) {
      try {
        num = scanner.nextInt();
        flag = false;
      } catch (InputMismatchException e) {
        System.out.println("整数値を入力してください。");
        scanner.next();
      }
    }

    System.out.println("16桁の2進数:");

    // メソッド
    StringBuilder binaryMethod = new StringBuilder(Integer.toBinaryString(num));

    int diff = 16 - binaryMethod.length();

    if (diff > 0) {
      for (int i = 0; i < diff; i++) {
        binaryMethod.insert(0, 0);
      }
    } else if (diff < 0) {
      binaryMethod.delete(0, Math.abs(diff));
    }

    System.out.println(binaryMethod);

    // 計算
    int[] binary = new int[16];

    for (int i = binary.length - 1; i >= 0; i--) {
      binary[i] = num % 2;
      num /= 2;
    }

    String binaryCalc = Arrays.stream(binary).mapToObj(String::valueOf).collect(Collectors.joining(""));

    System.out.println(binaryCalc);

    System.out.println(binaryMethod.toString().equals(binaryCalc));
  }
}
