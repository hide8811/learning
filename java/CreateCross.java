import java.util.Scanner;

public class CreateCross {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    StringBuilder sb = new StringBuilder();

    int size = scanner.nextInt();
    int markPosition1 = 1;
    int markPosition2 = size;

    for (int l = 1; l <= size; l++) {
      for (int c = 1; c <= size; c++) {
        if (markPosition1 == c || markPosition2 == c) {
          sb.append("x");
        } else {
          sb.append(" ");
        }
      }

      System.out.println(sb);
      sb.delete(0, sb.length());

      markPosition1++;
      markPosition2--;
    }
  }
}
