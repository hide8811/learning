# frozen_string_literal: true

# クラスメソッドの追加
class Array
  def change_numbers
    numbers = ('0'..'9').to_a + ('a'..'z').to_a

    if self[0].is_a?(String)
      map { |n| numbers.index(n) }
    else
      map { |n| numbers[n] }
    end
  end
end

# クラスメソッドの追加
class Integer
  def carry_up(radix)
    num = self

    if num >= radix
      num -= radix
      carry = 1
    else
      carry = 0
    end

    [carry, num]
  end
end

def complement_decreased(radix, num)
  num_ary = num.split('').change_numbers

  num_ary.map { |n| (radix - 1) - n }.change_numbers.join
end

def complement(radix, num)
  num_ary = num.split('').change_numbers.map! { |n| (radix - 1) - n }

  carry = 1

  num_ary.reverse.map do |n|
    n += carry

    carry, num = n.carry_up(radix)

    n
  end.reverse.change_numbers.join
end

loop do
  print '基数: '
  radix = gets.chomp

  case radix
  when *('2'..'32').to_a
    radix = radix.to_i
  when 'exit'
    exit
  else
    puts 'error'
    puts '' # 空行
    next
  end

  print '数値: '
  number = gets.chomp

  complement_decreased = complement_decreased(radix, number).sub(/^0+(?=\d+)/, '')
  complement = complement(radix, number).sub(/^0+(?=\d+)/, '')

  puts "#{radix - 1}の補数: #{complement_decreased}"
  puts "#{radix}の補数: #{complement}"
  puts '' # 空行
end
