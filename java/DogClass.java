import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;

public class DogClass {
  private static Scanner scanner = new Scanner(System.in);

  public static void main(String[] args) {
    Dog pochi = new Dog("ポチ");
    Dog taro = new Dog("タロウ");

    pochi.setAge(5);
    pochi.setBreed("雑種");
    taro.setAge(6);
    taro.setBreed("柴犬");

    List<Dog> dogData = new ArrayList<Dog>();
    dogData.add(pochi);
    dogData.add(taro);

    boolean flag = true;
    String selectMessage = "[1]作成　[2]編集　[3]削除　[4]一覧　[0]終了";

    while (flag) {
      System.out.println(); // 改行
      System.out.println(selectMessage);
      System.out.print("選択: ");
      int num = scanner.nextInt();
      System.out.println(); // 改行

      switch (num) {
        case 1:
          newDog(dogData);
          break;

        case 2:
          editDog(dogData);
          break;

        case 3:
          deleteDog(dogData);
          break;

        case 4:
          eachShowDog(dogData);
          break;

        case 0:
          flag = false;
          break;
      }
    }
  }

  static void newDog(List<Dog> dogData) {
    System.out.print("名前: ");
    String name = scanner.next();

    Dog newDog = new Dog(name);

    dogData.add(new Dog(name));

    System.out.println(); // 改行
    System.out.println(newDog.getName() + "を追加しました。");
  }

  static void printDogNameList(List<Dog> dogData) {
    StringBuilder sb = new StringBuilder();

    for (int i = 0; i < dogData.size(); i++) {
      sb.append("[" + (i + 1) + "]" + dogData.get(i).getName() + " ");
    }

    sb.append("[0]中止");

    System.out.println(sb);
  }

  static void editDog(List<Dog> dogData) {
    int editNum;
    printDogNameList(dogData);

    do {
      System.out.print("編集する犬: ");
      editNum = scanner.nextInt() - 1;
      System.out.println(); // 改行

      if (editNum < -1 || dogData.size() - 1 < editNum) {
        System.out.println("存在しません。");
        System.out.println(); // 改行
      }
    } while (editNum < -1 || dogData.size() - 1 < editNum);

    if (editNum == -1) { return; }

    Dog editDog = dogData.get(editNum);

    editDog.showProfile();
    System.out.println(); // 改行

    String editList = "[1]名前　[2]年齢　[3]犬種　[0]中止";
    System.out.println(editList);

    System.out.print("編集する箇所: ");
    int editPlace = scanner.nextInt();

    switch (editPlace) {
      case 1:
        String dogName = editDog.getName();

        System.out.println(); // 改行
        System.out.print("名前: ");
        String newName = scanner.next();

        editDog.setName(newName);

        System.out.println(); // 改行
        System.out.println(dogName + "の名前を、" + editDog.getName() + "に変更しました。");
        break;

      case 2:
        System.out.println(); // 改行
        System.out.print("年齢: ");
        int newAge = scanner.nextInt();

        editDog.setAge(newAge);

        System.out.println(); // 改行
        System.out.println(editDog.getName() + "の年齢を、" + editDog.getAge() + "歳に変更しました。");
        break;

      case 3:
        System.out.println(); // 改行
        System.out.print("犬種: ");
        String newBreed = scanner.next();

        editDog.setBreed(newBreed);

        System.out.println(); // 改行
        System.out.println(editDog.getName() + "の犬種を、" + editDog.getBreed() + "に変更しました。");
        break;

      default:
        break;
    }
  }

  static void deleteDog(List<Dog> dogData) {
    int deleteNum;
    printDogNameList(dogData);

    do {
      System.out.print("削除する犬: ");
      deleteNum = scanner.nextInt() - 1;

      if (deleteNum < -1 || dogData.size() -1 < deleteNum) {
        System.out.println("存在しません。");
        System.out.println(); // 改行
      }
    } while (deleteNum < -1 || dogData.size() -1 < deleteNum);

    if (deleteNum == -1) { return; }

    if (0 <= deleteNum && deleteNum <= dogData.size() ) {
      String deleteName = dogData.get(deleteNum).getName();

      dogData.remove(deleteNum);

      System.out.println(); // 改行
      System.out.println(deleteName + "を削除しました。");
    }
  }

  static void eachShowDog(List<Dog> dogData) {
    System.out.println("---");

    dogData.forEach(dog -> {
      dog.showProfile();
      System.out.println("---");
    });
  }
}

class Dog {
  private String name;
  private int age = -1;
  private String breed = "--";

  public Dog(String name) {
    this.name = name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public void setBreed(String breed) {
    this.breed = breed;
  }

  public String getName() {
    return this.name;
  }

  public int getAge() {
    return this.age;
  }

  public String getBreed() {
    return this.breed;
  }

  public void showProfile() {
    System.out.println("名前: " + this.name);

    if (this.age < 0) {
      System.out.println("年齢: --");
    } else {
      System.out.println("年齢: " + this.age + "歳");
    }

    System.out.println("犬種: " + this.breed);
  }
}
