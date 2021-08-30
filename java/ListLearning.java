import java.util.List;
import java.util.ArrayList;

public class ListLearning {
  public static void main(String[] args) {
    List<String> list = new ArrayList<>();
    List<String> list2 = new ArrayList<>();

    list.add("hoge");
    list.add("fuga");
    list.add("piyo");

    System.out.println(list); // => [hoge, fuga, piyo]

    System.out.println(list.get(0)); // => hoge

    list.add(1, "hogehoge");
    System.out.println(list); // => [hoge, hogehoge, fuga, piyo]

    System.out.println(list.size()); // => 4

    System.out.println(list.isEmpty()); // => false
    System.out.println(list2.isEmpty()); // => true

    System.out.println(list.contains("fuga")); // true
    System.out.println(list.contains("fugafuga")); // false

    System.out.println(list.indexOf("fuga")); // 2

    list.remove(1);
    System.out.println(list); // => [hoge, fuga, piyo]
    System.out.println(list.get(1)); // => fuga

    List<String> list3 = new ArrayList<>() {
      {
        add("hogehoge");
        add("fugafuga");
        add("piyopiyo");
      }
    };

    System.out.println(list3); // => [hogehoge, fugafuga, piyopiyo]

    list.addAll(list3);
    System.out.println(list); // => [hoge, fuga, piyo, hogehoge, fugafuga, piyopiyo]
    System.out.println(list3); // => [hogehoge, fugafuga, piyopiyo]

    list.add("hoga");
    System.out.println(list); // => [hoge, fuga, piyo, hogehoge, fugafuga, piyopiyo, hoga]
    list.remove("hoge");
    System.out.println(list); // => [fuga, piyo, hogehoge, fugafuga, piyopiyo, hoga]

    list.add("fuga");
    System.out.println(list); // => [fuga, piyo, hogehoge, fugafuga, piyopiyo, hoga, fuga]
    List<String> list4 = new ArrayList<>() {
      {
        add("fuga");
        add("piyopiyo");
      }
    };
    list.removeAll(list4);
    System.out.println(list); // => [piyo, hogehoge, fugafuga, hoga]

    list.clear();
    System.out.println(list); // => []
  }
}
