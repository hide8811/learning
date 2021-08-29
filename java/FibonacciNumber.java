public class FibonacciNumber {
  public static void main(String[] args) {
    StringBuilder sb = new StringBuilder();

    int num1 = 0;
    int num2 = 1;
    int tmp;

    sb.append(num1).append(" ");

    while (num2 < 1000) {
      sb.append(num2).append(" ");

      tmp = num2;
      num2 += num1;
      num1 = tmp;
    }

    System.out.println(sb);
  }
}
