# frozen_string_literal: true

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
  left = left.split('').map(&:to_i)
  right = right.split('').map(&:to_i)

  left.zip(right).map(&:sum)
end

def sum_to_i(radix, left, right)
  ary = sum_ary(left, right)

  carry = 0

  ary.reverse!.map! do |a|
    a += carry

    a -= radix if a >= radix
    carry = a >= radix ? 1 : 0

    a
  end

  ary.push(1) if carry == 1

  ary.reverse.join
end

radix = gets.to_i

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

int = sum_to_i(radix, left_int, right_int)

# 小数
if left_dec.length > right_dec.length
  diff = left_dec.length - right_dec.length
  right_dec += ('0' * diff)
elsif right_dec.length > left_dec.length
  diff = right_dec.length - left_dec.length
  left_dec += ('0' * diff)
end

dec = sum_to_i(radix, left_dec, right_dec)

if dec.length != left_dec.length
  dec = dec[1..-1]
  int = (int.to_i + 1).to_s
end

puts dec.match?(/^0+$/) ? int : "#{int}.#{dec}".to_f
