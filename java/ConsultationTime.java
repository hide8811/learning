/*
|      | 日曜 | 月曜 | 火曜 | 水曜 | 木曜 | 金曜 | 土曜 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 午前 | 休診 |  ◯   | 休診 |  ◯   |  ◯   | 休診 |  ◯   |
| 午後 | 休診 |  ◯   |  ◯   |  ◯   |  ◯   |  ◯   | 休診 |
| 夜間 | 休診 |  ◯   |  ◯   | 休診 |  ◯   |  ◯   | 休診 |
*/

import java.util.Scanner;

public class ConsultationTime {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    String weekdayList = "[0]: 日曜、[1]: 月曜、[2]: 火曜、[3]: 水曜、[4]: 木曜、[5]: 金曜、[6]: 土曜";
    String timeframeList = "[0]: 午前、[1]: 午後、[2]: 夜間";

    System.out.println("曜日を入力してください");
    System.out.println(weekdayList);
    int weekday = scanner.nextInt();

    while (weekday < 0 || 6 < weekday) {
      System.out.println("0 〜 6の数値で入力してください");
      weekday = scanner.nextInt();
    }

    System.out.println("時間帯を入力してください");
    System.out.println(timeframeList);
    int timeframe = scanner.nextInt();

    while (timeframe < 0 || 2 < timeframe) {
      System.out.println("0 〜 2の数値で入力してください");
      timeframe = scanner.nextInt();
    }

    System.out.println("----------------------");

    switch(weekday) {
      case 0:
        System.out.println("休診日です");
        break;
      case 1:
        System.out.println("受診可能です");
        break;
      case 2:
        if (timeframe == 0) {
          System.out.println("休診日です");
        } else {
          System.out.println("受診可能です");
        }
        break;
      case 3:
        if (timeframe == 2) {
          System.out.println("休診日です");
        } else {
          System.out.println("受診可能です");
        }
        break;
      case 4:
        System.out.println("受診可能です");
        break;
      case 5:
        if (timeframe == 0) {
          System.out.println("休診日です");
        } else {
          System.out.println("受診可能です");
        }
        break;
      case 6:
        if (timeframe == 0) {
          System.out.println("受診可能です");
        } else {
          System.out.println("休診日です");
        }
    }
  }
}
