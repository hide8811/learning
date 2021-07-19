# frozen_string_literal: true

require 'bigdecimal/util'

# クラスメソッドを追加
class Integer
  def ten?
    self == 10
  end

  def not_ten?
    self != 10
  end
end

# クラスメソッドを追加
class Float
  def disassembly
    int, dec = to_s.split('.')
    zero_dec = to_d - int.to_d

    # self = 1.2
    # ['1', '0.2', '2']
    [int, zero_dec, dec]
  end
end

def integral_n_to_ten(integral, radix)
  ary = integral.split('').reverse
  ary.each_with_index.inject(0) { |sum, (elem, i)| sum + (elem.to_i * radix**i) }
end

def decimal_n_to_ten(decimal, radix)
  ary = decimal.split('')

  ary.each_with_index.inject(0) do |sum, (elem, i)|
    product = elem.to_d * radix.to_d**-(i + 1).to_d

    (sum.to_d + product.to_d).to_f
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
    int, decimal, = (decimal.to_d * radix.to_d).to_f.disassembly
    dec += int.to_s

    if dec.length > 20
      dec += '...'
      break
    end
  end

  dec
end

print '基数:'
original_radix = gets.to_i
print '数値:'
number = gets.to_f
print '変換する基数:'
after_radix = gets.to_i

# to_s to_i メソッド使用 ========================
# 数値は整数のみ、基数は0, 2 〜 36 まで
after_number_a =
  if original_radix == after_radix || number.zero?
    number
  elsif original_radix.ten? && after_radix.not_ten?
    num = number.to_i
    num.to_s(after_radix)
  elsif original_radix.not_ten? && after_radix.ten?
    num = number.to_i
    num.to_s.to_i(original_radix)
  else
    num = number.to_i
    tmp = num.to_s.to_i(original_radix)
    tmp.to_s(after_radix)
  end

puts # 空行
puts "結果: #{after_number_a}"
# ===============================================

# 計算使用 ======================================
# 基数は10まで
if original_radix == after_radix || number.zero?
  puts "結果: #{number}"
  exit
end

integral, zero_dec, decimal = number.disassembly

# n_ary = number.split('')
# point_index = n_ary.index('.')

after_number_b =
  if original_radix.not_ten? && after_radix.ten?
    if decimal.to_i.zero?
      integral_n_to_ten(integral, original_radix)
    else
      integral_n_to_ten(integral, original_radix) + decimal_n_to_ten(decimal, original_radix)
    end
  elsif original_radix.ten? && after_radix.not_ten?
    if decimal.to_i.zero?
      integral_ten_to_n(integral, after_radix)
    else
      "#{integral_ten_to_n(integral.to_i, after_radix)}.#{decimal_ten_to_n(zero_dec.to_f, after_radix)}"
    end

  # original_radix.not_ten? && after_radix.not_ten?
  elsif decimal.to_i.zero?
    num = integral_n_to_ten(integral, original_radix)

    integral_ten_to_n(num, after_radix)
  else
    num = (integral_n_to_ten(integral, original_radix).to_d + decimal_n_to_ten(decimal, original_radix).to_d).to_f

    int, z_dec, = num.disassembly

    "#{integral_ten_to_n(int.to_i, after_radix)}.#{decimal_ten_to_n(z_dec.to_f, after_radix)}"
  end

puts # 空行
puts "結果: #{after_number_b}"
# ===============================================
