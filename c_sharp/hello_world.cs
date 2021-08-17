/*
mcs hello_world.cs  => コンパイル
mono hello_world.exe  => 実行
*/

using System;

// Hello_Worldクラス
class Hello_World
{
  // 静的な戻り値なしのMainメソッド
  static void Main()
  {
    Console.WriteLine("Hello World");
  }
}

/*
Main()

エントリーポイント。
ここから処理が始まる。
必須。

---

static

静的メンバー
インスタンスを作成しない。

---

void

返り値なし

---

Console.WriteLine();

コンソールに()内の値を出力。
*/
