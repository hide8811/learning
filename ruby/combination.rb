# frozen_string_literal: true

puts '式を入力 "nCn" || "exit"'

loop do
  print '式: '
  formula = gets.chomp

  case formula
  when /^\d+C\d+$/
    left, right = formula.split('C').map(&:to_i)

    solution = 1

    right.times do
      solution = (solution * left).quo(right)

      left -= 1
      right -= 1
    end

    puts "解: #{solution.to_s.sub(%r{/1$}, '')}"

  when 'exit'
    exit

  else
    puts 'error'
  end

  puts '' # 空行
end
