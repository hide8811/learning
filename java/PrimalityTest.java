import java.util.Scanner;
public class PrimalityTest {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int num = scanner.nextInt();

    int root = (int)Math.sqrt(num);

    for (int r = 2; r <= root; r++) {
      if (num % r == 0) {
        System.out.println("素数ではありません");
        System.exit(0);
      }
    }

    System.out.println("素数です");
  }
}
