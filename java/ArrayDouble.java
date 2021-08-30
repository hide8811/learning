import java.util.Scanner;
import java.util.stream.Stream;

public class ArrayDouble {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    StringBuilder sb = new StringBuilder();

    System.out.println("数値を入力(スペース区切り)");

    String[] StringNumbers = scanner.nextLine().split(" ");

    int[] numbers = Stream.of(StringNumbers).mapToInt(Integer::parseInt).toArray();

    for (int num: numbers) {
      sb.append(num * 2).append(" ");
    }

    System.out.println(sb.toString().trim());
  }
}
