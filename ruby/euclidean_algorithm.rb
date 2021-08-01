# frozen_string_literal: true

# <ユークリッドの互助法>
# 2つの自然数の最大公約数を求めるアルゴリズム。
# 2つの自然数a, bについて、a ÷ b = p 余り r となるとき、(a, b)の最大公約数と(b, r)の最大公約数は等しい。

puts '1つめの数字'
num1 = gets.to_i

puts '2つめの数字'
num2 = gets.to_i

if num1 > num2
  a = num1
  b = num2
else
  a = num2
  b = num1
end

until a.zero? || b.zero?
  a %= b

  a, b = b, a
end

# greatest common divisor
gcd = a.zero? ? b : a

puts "最大公約数: #{gcd}"
puts "　　　　　 (#{num1.gcd(num2)})"
