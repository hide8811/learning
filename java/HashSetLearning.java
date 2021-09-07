import java.util.HashSet;

public class HashSetLearning {
  public static void main(String[] args) {
    // 宣言
    HashSet<String> hashSet = new HashSet<String>();

    // 要素の追加
    hashSet.add("hoge");
    hashSet.add("fuga");
    hashSet.add("piyo");
    System.out.println(hashSet); // => [hoge, fuga, piyo]

    // 要素が含まれているかの確認
    boolean hogeExists = hashSet.contains("hoge");
    System.out.println(hogeExists); // => true
    boolean hogehogeExists = hashSet.contains("hogehoge");
    System.out.println(hogehogeExists); // => false

    // 要素数の取得
    int size = hashSet.size();
    System.out.println(size); // 3

    // 空かの確認
    HashSet<String> emptySet = new HashSet<String>();
    boolean emptySetEmp = emptySet.isEmpty();
    System.out.println(emptySetEmp); // true

    boolean hashSetEmp = hashSet.isEmpty();
    System.out.println(hashSetEmp); // false

    // 要素の削除
    hashSet.remove("fuga");
    System.out.println(hashSet); // => [hoge, piyo]

    // 全ての要素を削除
    hashSet.clear();
    System.out.println(hashSet); // => []

    // HashMapとの違い

    // 重複が不可
    HashSet<String> duplication = new HashSet<String>() {
      {
        add("hoge");
        add("fuga");
        add("piyo");
        add("hoge"); // 重複
      }
    };

    System.out.println(duplication); // => [hoge, fuga, piyo]

    // 順位はない
    HashSet<Integer> numSet = new HashSet<Integer>() {
      {
        add(3);
        add(2);
        add(1);
      }
    };

    System.out.println(numSet); // => [1, 2, 3]
  }
}
