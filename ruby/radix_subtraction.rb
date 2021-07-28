# frozen_string_literal: true

# クラスメソッドの追加
class Array
  def change_numbers!
    num_ary = ('0'..'9').to_a + ('a'..'z').to_a

    if self[0].is_a?(String)
      map! do |n|
        n == '.' ? '.' : num_ary.index(n)
      end
    else
      map! do |n|
        n == '.' ? '.' : num_ary[n]
      end
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

def disassembly(num)
  ary = num.split('.')

  ary.push('0') if ary.length == 1

  ary
end

def align_digits(left, right)
  left_length = left.length
  right_length = right.length

  if left_length > right_length
    diff = left_length - right_length

    right = ('0' * diff) + right
  elsif right_length > left_length
    diff = right_length - left_length

    left = ('0' * diff) + left
  end

  [left, right]
end

def make_array(left, right)
  if left.match(/^\d+\.\d+$/) || right.match(/^\d+\.\d+$/)
    left_int, left_dec = disassembly(left)
    right_int, right_dec = disassembly(right)

    left_int, right_int = align_digits(left_int, right_int)

    left_ary = "#{left_int}.#{left_dec}".split('')
    right_ary = "#{right_int}.#{right_dec}".split('')
  else
    left_ary, right_ary = align_digits(left, right).map { |a| a.spmit('') }
  end

  [left_ary, right_ary]
end

def subtraction(left, right, radix)
  left = 0 if left.nil?
  right = 0 if right.nil?

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
  carry = 0

  left.zip(right).reverse.map! do |le, ri|
    if le == '.'
      '.'
    else
      le -= carry

      an, carry = subtraction(le, ri, radix)

      an
    end
  end.reverse
end

loop do
  print '基数: '
  radix = gets.chomp

  exit if radix == 'exit'

  unless ('2'..'36').include?(radix)
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
  num.sub!(/(?<=\.0)0+$/, '')

  num.sub!(/0+$/, '') if num.match?(/\.\d*[1-9]+0+$/)

  puts '' # 空行
  puts "解: #{sign}#{num}"
  puts '' # 空行
end
