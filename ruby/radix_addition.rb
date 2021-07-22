# frozen_string_literal: true

# クラスメソッドを追加
class Array
  def change_number
    num = ('0'..'9').to_a + ('A'..'Z').to_a

    map { |i| num[i] }
  end
end

def decimal_split(number)
  if number.include?('.')
    int, dec = number.split('.')
  else
    int = number
    dec = '0'
  end

  [int, dec]
end

def sum_ary(left, right)
  num = ('0'..'9').to_a + ('A'..'Z').to_a

  left = left.split('').map { |n| num.index(n) }
  right = right.split('').map { |n| num.index(n) }

  left.zip(right).map(&:sum)
end

def carrying(num, radix)
  if num >= radix
    num -= radix
    carry = 1
  else
    carry = 0
  end

  [num, carry]
end

def number_sum(radix, left, right)
  ary = sum_ary(left, right)

  carry = 0

  new_ary = ary.reverse.map do |num|
    num += carry
    num, carry = carrying(num, radix)

    num
  end

  new_ary.push(1) if carry == 1

  new_ary.reverse.change_number.join
end

print '基数：'
radix = gets.to_i

print '計算：'
# 1234+5678
formula = gets.chomp

left, right = formula.split('+')

left_int, left_dec = decimal_split(left)
right_int, right_dec = decimal_split(right)

# 整数
if left_int.length > right_int.length
  diff = left_int.length - right_int.length
  right_int = ('0' * diff) + right_int
elsif right_int.length > left_int.length
  diff = right_int.length - left_int.length
  left_int = ('0' * diff) + left_int
end

int = number_sum(radix, left_int, right_int)

# 小数
if left_dec.length > right_dec.length
  diff = left_dec.length - right_dec.length
  right_dec += ('0' * diff)
elsif right_dec.length > left_dec.length
  diff = right_dec.length - left_dec.length
  left_dec += ('0' * diff)
end

dec = number_sum(radix, left_dec, right_dec)

if dec.length != left_dec.length
  dec = dec[1..-1]
  int = (int.to_i + 1).to_s
end

p int
puts dec.match?(/^0+$/) ? int : "#{int}.#{dec}".to_f
