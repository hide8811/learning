# frozen_string_literal: true

puts '式を入力　"nPn" || "n!" || "exit"'

loop do
  print '式: '
  formula = gets.chomp

  case formula
  when /^\d+P\d+$/
    left, right = formula.split('P').map(&:to_i)

    solution = 1

    right.times do
      solution *= left
      left -= 1
    end

    puts "解: #{solution}"

  when /^\d+!$/
    num = formula.chop.to_i
    solution = 1

    num.times do
      solution *= num
      num -= 1
    end

    puts "解: #{solution}"

  when 'exit'
    exit

  else
    puts 'error'
  end

  puts '' # 空行
end
