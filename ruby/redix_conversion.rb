# frozen_string_literal: true

# クラスメソッドを追加
class Integer
  def ten?
    self == 10
  end

  def not_ten?
    self != 10
  end
end

print '基数:'
original_radix = gets.to_i
print '数値:'
number = gets.to_i
print '変換する基数:'
after_radix = gets.to_i

# to_s to_i メソッド使用 ========================
# 数値は整数のみ、基数は0, 2 〜 36 まで
after_number_a =
  if original_radix == after_radix
    number
  elsif original_radix.ten? && after_radix.not_ten?
    number.to_s(after_radix)
  elsif original_radix.not_ten? && after_radix.ten?
    number.to_s.to_i(original_radix)
  else
    tmp = number.to_s.to_i(original_radix)
    tmp.to_s(after_radix)
  end

puts # 空行
puts "結果: #{after_number_a}"
