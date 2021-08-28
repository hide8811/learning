import java.util.Scanner;

public class CreateTriangle {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    int length = scanner.nextInt();
    String line = "";

    for (int i = 1; i <= length; i++) {
      line += "$";
      System.out.println(line);
    }
  }
}
