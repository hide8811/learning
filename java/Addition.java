import java.util.Scanner;

public class Addition {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.println("数値を入力　Enterで次の数値　[0]で合計");

    int num;
    int sum = 0;

    do {
      num = scanner.nextInt();
      sum += num;
    } while(num != 0);

    System.out.println("------------");
    System.out.print("合計: ");
    System.out.println(sum);
  }
}
