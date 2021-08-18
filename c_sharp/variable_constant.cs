using System;

class Variable
{
  static void Main()
  {
    // 文字列型
    Console.WriteLine("文字列");
    string s = "Hello World";
    Console.WriteLine(s);

    // 文字型
    Console.WriteLine("文字型");
    char c = '文';
    Console.WriteLine(c);

    // 整数型
    Console.WriteLine("整数値");
    int i = 1234;
    Console.WriteLine(i);

    // 浮動小数点 単精度  数値の最後にf(F)が必要
    Console.WriteLine("単精度 浮動小数");
    float f = 12.34f;
    Console.WriteLine(f);

    // 浮動小数点 倍精度  数値の最後のd(D)はなくても良い
    Console.WriteLine("倍精度 浮動小数");
    double d = 12.34;
    Console.WriteLine(d);

    // 指数表記
    Console.WriteLine("指数表記(1.23e-4)");
    double de = 1.23e-4;// => 0.000123
    Console.WriteLine(de);

    // ブール値
    Console.WriteLine("ブール値");
    bool b = true;
    Console.WriteLine(b);

    // 定数宣言
    Console.WriteLine("定数");
    const int ci = 123;
    Console.WriteLine(ci);
  }
}
