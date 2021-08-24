/*
|      | 日曜 | 月曜 | 火曜 | 水曜 | 木曜 | 金曜 | 土曜 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 午前 | 休診 |  ◯   | 休診 |  ◯   |  ◯   | 休診 |  ◯   | 8:00 ~ 13:00
| 午後 | 休診 |  ◯   |  ◯   |  ◯   |  ◯   |  ◯   | 休診 | 13:00 ~ 18:00
| 夜間 | 休診 |  ◯   |  ◯   | 休診 |  ◯   |  ◯   | 休診 |
*/

import java.util.Scanner;
import java.util.Calendar;

public class ConsultationTime {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    Calendar calendar = Calendar.getInstance();

    String weekdayList = "[0]:本日  [1]:日曜  [2]:月曜  [3]:火曜  [4]:水曜  [5]:木曜  [6]:金曜  [7]:土曜";
    String timeframeList = "[0]:現在  [1]:午前(8:00 ~ 13:00)  [2]:午後(13:00 ~ 18:00)  [3]:夜間";

    System.out.println("曜日を入力してください");
    System.out.println(weekdayList);
    int weekday = scanner.nextInt();

    while (weekday < 0 || 7 < weekday) {
      System.out.println("0 〜 7の数値で入力してください");
      weekday = scanner.nextInt();
    }

    if (weekday == 0) weekday = calendar.get(Calendar.DAY_OF_WEEK);

    int ca = calendar.get(Calendar.AM_PM);

    System.out.println("時間帯を入力してください");
    System.out.println(timeframeList);
    int timeframe = scanner.nextInt();

    while (timeframe < 0 || 3 < timeframe) {
      System.out.println("0 〜 3の数値で入力してください");
      timeframe = scanner.nextInt();
    }

    if (timeframe == 0) {
      int hour = calendar.get(Calendar.HOUR_OF_DAY);

      if (8 <= hour && hour < 13) {
        timeframe = 1;
      } else if (13 <= hour && hour < 18) {
        timeframe = 2;
      } else {
        timeframe = 3;
      }
    }

    System.out.println("----------------------");

    switch(weekday) {
      case 1:
        System.out.println("休診日です");
        break;
      case 2:
        System.out.println("受診可能です");
        break;
      case 3:
        if (timeframe == 1) {
          System.out.println("休診日です");
        } else {
          System.out.println("受診可能です");
        }
        break;
      case 4:
        if (timeframe == 3) {
          System.out.println("休診日です");
        } else {
          System.out.println("受診可能です");
        }
        break;
      case 5:
        System.out.println("受診可能です");
        break;
      case 6:
        if (timeframe == 1) {
          System.out.println("休診日です");
        } else {
          System.out.println("受診可能です");
        }
        break;
      case 7:
        if (timeframe == 1) {
          System.out.println("受診可能です");
        } else {
          System.out.println("休診日です");
        }
    }
  }
}
