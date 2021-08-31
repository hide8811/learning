import java.util.Scanner;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Stream;
import java.util.stream.Collectors;

public class DivideIntoOddEven {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    List<Integer> evenList = new ArrayList<>();
    List<Integer> oddList = new ArrayList<>();

    System.out.println("数値を入力");
    String[] strNum = scanner.nextLine().split(" ");

    int[] numbers = Arrays.stream(strNum).mapToInt(Integer::parseInt).toArray();

    for (int num: numbers) {
      if (num % 2 == 0) {
        evenList.add(num);
      } else {
        oddList.add(num);
      }
    }

    String even = evenList.stream().map(n -> Integer.toString(n)).collect(Collectors.joining(" "));
    String odd = oddList.stream().map(n -> Integer.toString(n)).collect(Collectors.joining(" "));

    System.out.println("偶数: " + even);
    System.out.println("奇数: " + odd);
  }
}
