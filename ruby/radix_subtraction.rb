# frozen_string_literal: true

def make_array(left, right)
  left_length = left.length
  right_length = right.length

  if left_length > right_length
    diff = left_length - right_length

    right = ('0' * diff) + right
  elsif right_length > left_length
    diff = right_length - left_length

    left = ('0' * diff) + left
  end

  [left.split(''), right.split('')]
end

def subtraction(left, right, radix)
  if left >= right
    ans = left - right
    carry = 0
  else
    ans = (left + radix) - right
    carry = 1
  end

  [ans, carry]
end

def ary_subtraction(left, right, radix)
  ary = left.zip(right).reverse

  carry = 0

  ary.map! do |le, ri|
    le = le.to_i - carry

    an, carry = subtraction(le.to_i, ri.to_i, radix)

    an
  end

  ary.reverse.join
end

loop do
  print '基数: '
  radix = gets.to_i

  unless (2..10).cover?(radix)
    puts 'error'
    puts '' # 空行
    next
  end

  exit if radix == 'exit'

  puts '式:'
  left = gets.chomp
  puts '-'
  right = gets.chomp

  if right > left
    left, right = right, left
    sign = '-'
  else
    sign = ''
  end

  left_ary, right_ary = make_array(left, right)

  num = ary_subtraction(left_ary, right_ary, radix)

  puts "#{sign}#{num}"
  puts '' # 空行
end
