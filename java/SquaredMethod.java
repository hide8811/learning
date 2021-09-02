import java.util.Scanner;

public class SquaredMethod {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.print("数値を入力: ");
    int num = scanner.nextInt();

    System.out.println(num + "^2 = " + squared(num));
  }

  static int squared(int num) {
    return num * num;
  }
}
