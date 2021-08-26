import java.util.Scanner;

public class PrimeFactorization {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.println("2以上の整数を入力");
    int num = scanner.nextInt();
    String ans = "";

    for (int i = 2; num > 1; i++) {
      while (num % i == 0) {
        ans += i + " ";
        num /= i;
      }
    }

    System.out.println(ans.trim());
  }
}
