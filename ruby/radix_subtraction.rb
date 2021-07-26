# frozen_string_literal: true

# クラスメソッドの追加
class Array
  def change_numbers!
    num_ary = ('0'..'9').to_a + ('a'..'z').to_a

    if self[0].is_a?(String)
      map! { |n| num_ary.index(n) }
    else
      map! { |n| num_ary[n] }
    end
  end
end

def sign_check(left_ary, right_ary)
  sign = ''

  left_ary.length.times do |n|
    next if left_ary[n] == right_ary[n]

    sign = '-' if right_ary[n] > left_ary[n]
    break
  end

  left_ary, right_ary = right_ary, left_ary if sign == '-'

  [left_ary, right_ary, sign]
end

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
    le -= carry

    an, carry = subtraction(le, ri, radix)

    an
  end

  ary.reverse!
end

loop do
  print '基数: '
  radix = gets.chomp

  exit if radix == 'exit'

  unless ('2'..'36').cover?(radix)
    puts 'error'
    puts '' # 空行
    next
  end

  radix = radix.to_i

  puts '式:'
  left = gets.chomp.downcase
  puts '-'
  right = gets.chomp.downcase

  left_ary, right_ary = make_array(left, right)

  left_ary, right_ary, sign = sign_check(left_ary, right_ary)

  left_ary.change_numbers!
  right_ary.change_numbers!

  num_ary = ary_subtraction(left_ary, right_ary, radix)
  num = num_ary.change_numbers!.join

  num.sub!(/^0+/, '')

  puts "#{sign}#{num}"
  puts '' # 空行
end
