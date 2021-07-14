# frozen_string_literal: true

require 'bigdecimal'

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
number = gets.chomp
print '変換する基数:'
after_radix = gets.to_i

# to_s to_i メソッド使用 ========================
# 数値は整数のみ、基数は0, 2 〜 36 まで
after_number_a =
  if original_radix == after_radix
    number
  elsif original_radix.ten? && after_radix.not_ten?
    number.to_i.to_s(after_radix)
  elsif original_radix.not_ten? && after_radix.ten?
    number.to_i(original_radix)
  else
    tmp = number.to_i(original_radix)
    tmp.to_s(after_radix)
  end

puts # 空行
puts "結果: #{after_number_a}"
# ===============================================

# 計算使用 ======================================
if original_radix == after_radix
  puts number
  exit
end

n_ary = number.split('')
point_index = n_ary.index('.')

after_number_b =
  if original_radix.not_ten? && after_radix.ten?
    if point_index
      integral = n_ary[0..(point_index - 1)]
      decimal = n_ary[(point_index + 1)..-1]

      integral_sum =
        integral.reverse.each_with_index.inject(0) { |sum, (elem, i)| sum + (elem.to_i * original_radix**i) }

      decimal_sum =
        decimal.each_with_index.inject(0) do |sum, (elem, i)|
          product = BigDecimal(elem) * BigDecimal(original_radix.to_s)**-BigDecimal((i + 1).to_s)
          (BigDecimal(sum.to_s) + BigDecimal(product.to_s)).to_f
        end

      integral_sum + decimal_sum
    else
      n_ary.reverse.each_with_index.inject(0) { |sum, (elem, i)| sum + (elem.to_i * original_radix**i) }
    end
  end

puts # 空行
puts "結果: #{after_number_b}"
# ===============================================
