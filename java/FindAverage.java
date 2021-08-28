import java.util.Scanner;

public class FindAverage {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    int num;
    int sum = 0;
    int count = 0;

    do {
      num = scanner.nextInt();
      sum += num;
      count += 1;
    } while(num != 0);

    System.out.println(sum / (count - 1));
  }
}
