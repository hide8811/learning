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

def integral_n_to_ten(integral_ary, radix)
  integral_ary.reverse.each_with_index.inject(0) { |sum, (elem, i)| sum + (elem.to_i * radix**i) }
end

def decimal_n_to_ten(decimal_ary, radix)
  decimal_ary.each_with_index.inject(0) do |sum, (elem, i)|
    i += 1
    product = BigDecimal(elem) * BigDecimal(radix.to_s)**-BigDecimal(i.to_s)

    (BigDecimal(sum.to_s) + BigDecimal(product.to_s)).to_f
  end
end

def integral_ten_to_n(integral, radix)
  int = []

  until integral.zero?
    i = integral % radix
    int.unshift(i)
    integral /= radix
  end

  int.join
end

def decimal_ten_to_n(decimal, radix)
  dec = ''

  until decimal.zero?
    decimal = (BigDecimal(decimal.to_s) * BigDecimal(radix.to_s)).to_f
    i = decimal.to_i.to_s
    dec += i
    decimal = (BigDecimal(decimal.to_s) - BigDecimal(i)).to_f
  end

  dec
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
if original_radix == after_radix || number == '0'
  puts "結果: #{number}"
  exit
end

n_ary = number.split('')
point_index = n_ary.index('.')

after_number_b =
  if original_radix.not_ten? && after_radix.ten?
    if point_index
      integral_ary = n_ary[0..(point_index - 1)]
      decimal_ary = n_ary[(point_index + 1)..-1]

      integral_n_to_ten(integral_ary, original_radix) + decimal_n_to_ten(decimal_ary, original_radix)
    else
      integral_n_to_ten(n_ary, original_radix)
    end

  elsif original_radix.ten? && after_radix.not_ten?
    if point_index
      integral = number.to_i
      decimal = (BigDecimal(number) - BigDecimal(integral.to_s)).to_f

      "#{integral_ten_to_n(integral, after_radix)}.#{decimal_ten_to_n(decimal, after_radix)}"
    else
      number = number.to_i

      integral_ten_to_n(number, after_radix)
    end

  # original_radix.not_ten? && after_radix.not_ten?
  elsif point_index
    integral_ary = n_ary[0..(point_index - 1)]
    decimal_ary = n_ary[(point_index + 1)..-1]

    num = integral_n_to_ten(integral_ary, original_radix) + decimal_n_to_ten(decimal_ary, original_radix)

    integral = num.to_i
    decimal = (BigDecimal(num.to_s) - BigDecimal(integral.to_s)).to_f

    "#{integral_ten_to_n(integral, after_radix)}.#{decimal_ten_to_n(decimal, after_radix)}"
  else
    num = integral_n_to_ten(n_ary, original_radix)

    integral_ten_to_n(num, after_radix)
  end

puts # 空行
puts "結果: #{after_number_b}"
# ===============================================
