import java.util.Scanner;

public class InfiniteLoop {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    String str;
    // while
    System.out.println("while");
    while (true) {
      str = scanner.next();

      if (str.equals("exit")) {
        break;
      } else {
        System.out.println(str);
      }
    }

    // for
    System.out.println("for");
    for (;;) {
      str = scanner.next();

      if (str.equals("exit")) {
        break;
      } else {
        System.out.println(str);
      }
    }
  }
}
