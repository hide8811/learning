import java.util.HashMap;

import java.util.Set;
import java.util.Collection;

public class HashMapLearning {
  public static void main(String[] args) {
    // 宣言
    HashMap<String, String> hashMap = new HashMap<String, String>();

    // キー・値の追加
    hashMap.put("hoge", "hogehoge");
    hashMap.put("fuga", "fugafuga");

    // キーに対応する値の取得
    String val = hashMap.get("hoge");
    System.out.println(val); // => hogehoge

    // キーが存在するかの確認
    boolean hogeKey = hashMap.containsKey("hoge");
    System.out.println(hogeKey); // => true

    boolean piyoKey = hashMap.containsKey("piyo");
    System.out.println(piyoKey); // => false

    // 値が存在するかの確認
    boolean hogeVal = hashMap.containsValue("hogehoge");
    System.out.println(hogeVal); // => true

    boolean piyoVal = hashMap.containsValue("piyopiyo");
    System.out.println(piyoVal); // => false

    // 全てのキーを取得
    Set<String> keySet = hashMap.keySet();
    System.out.println(keySet); // => [hoge, fuga]

    // 全ての値を取得
    Collection<String> values = hashMap.values();
    System.out.println(values); // => [hogehgoe, fugafuga]

    // 要素の数を取得
    int size = hashMap.size();
    System.out.println(size); // => 2

    // 指定したキーの要素を削除
    hashMap.remove("hoge");
    System.out.println(hashMap.keySet()); // => [fuga]

    // 要素が空かを確認
    HashMap<String, String> emptyHashMap = new HashMap<String, String>();

    boolean empHash = hashMap.isEmpty();
    System.out.println(empHash); // => false

    boolean empEmptyHash = emptyHashMap.isEmpty();
    System.out.println(empEmptyHash); // => true

    // 全ての要素を削除
    hashMap.clear();
    System.out.println(hashMap.isEmpty()); // => true

    // 全てのキーと値
    HashMap<String, String> hm = new HashMap<String, String>() {
      {
        put("hoge", "hogehoge");
        put("fuga", "fugafuga");
        put("piyo", "piyopiyo");
      }
    };

    Set<HashMap.Entry<String, String>> set = hm.entrySet();
    System.out.println(set); // => [hoge=hogehoge, fuga=fugafuga, piyo=piyopiyo]

    // 繰り返し (キー・値)
    //forEach
    hm.forEach((key, value) -> {
      System.out.println(key + ": " + value);
    });
    // => hoge: hogehoge
    //    fuga: fugafuga
    //    piyo: piyopiyo

    // 拡張for文
    for (HashMap.Entry<String, String> entry: hm.entrySet()) {
      System.out.println(entry.getKey() + ": " + entry.getValue());
    }
    // => hoge: hogehoge
    //    fuga: fugafuga
    //    piyo: piyopiyo
  }
}
