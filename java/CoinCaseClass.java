import java.util.HashMap;
import java.util.Scanner;

public class CoinCaseClass {
  public static void main(String[] args) {
    CoinCase coinCase = new CoinCase();
    Scanner scanner = new Scanner(System.in);

    while (true) {
      System.out.println("[1]追加　[2]個別枚数　[3]個別金額　[4]合計枚数　[5]合計金額　[0]終了");

      System.out.print("選択: ");
      int select = scanner.nextInt();

      switch (select) {
        case 1:
          System.out.print("種類: ");
          int coinToAdd = scanner.nextInt();

          System.out.print("枚数: ");
          int numberToAdd = scanner.nextInt();

          if (coinCheck(coinToAdd)) {
            coinCase.addCoins(coinToAdd, numberToAdd);
            System.out.println(coinToAdd + "円玉を" + numberToAdd + "枚追加");
          } else {
            System.out.println("error");
          }

          break;

        case 2:
          System.out.print("種類: ");
          int coinOfNumber = scanner.nextInt();

          if (coinCheck(coinOfNumber)) {
            System.out.println("合計: " + coinCase.getCount(coinOfNumber) + "枚");
          } else {
            System.out.println("error");
          }

          break;

        case 3:
          System.out.print("種類: ");
          int coinOfTotal = scanner.nextInt();

          if (coinCheck(coinOfTotal)) {
            System.out.println("合計: " + coinCase.getAmount(coinOfTotal) + "円");
          } else {
            System.out.println("error");
          }

          break;

        case 4:
          System.out.println("合計: " + coinCase.getCount() + "枚");
          break;

        case 5:
          System.out.println("合計: " + coinCase.getAmount() + "円");
          break;

        case 0:
          System.exit(0);
      }
    }
  }

  static boolean coinCheck(int num) {
    int[] coins = { 500, 100, 50, 10, 1 };

    for (int coin: coins) {
      if (coin == num) {
        return true;
      }
    }

    return false;
  }
}

class CoinCase {
  private HashMap<Integer, Integer> coinCase;

  public CoinCase() {
    coinCase = new HashMap<Integer, Integer>() {
      {
        put(500, 0);
        put(100, 0);
        put(50, 0);
        put(10, 0);
        put(1, 0);
      }
    };
  }

  public void addCoins(int coin, int num) {
    int total = this.coinCase.get(coin) + num;
    this.coinCase.replace(coin, total);
  }

  public int getCount(int coin) {
    return this.coinCase.get(coin);
  }

  public int getCount() {
    int sum = 0;
    for (int count: coinCase.values()) {
      sum += count;
    }

    return sum;
  }

  public int getAmount() {
    int sum = 0;
    for (HashMap.Entry<Integer, Integer> entry: coinCase.entrySet()) {
      sum += entry.getKey() * entry.getValue();
    }

    return sum;
  }

  public int getAmount(int coin) {
    return coin * this.coinCase.get(coin);
  }

}
