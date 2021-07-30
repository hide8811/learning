# frozen_string_literal: true

def error_message
  puts 'error'
  puts '' # 空行
end

# 論理シフト Logical shift
# 左シフト
def left_logical_shift(num, shift)
  num_ary = num.to_s.split('')

  num_ary.shift(shift)
  num_ary += Array.new(shift, '0')

  num_ary.join
end

# 右シフト
def right_logical_shift(num, shift)
  num_ary = num.to_s.split('')

  num_ary.pop(shift)
  num_ary = Array.new(shift, '0') + num_ary

  num_ary.join
end

# 算術シフト Arithmetic shift
# 右シフト
# 左シフト

loop do
  puts '0:論理シフト | 1:算術シフト'
  print 'シフト演算: '
  operator = gets.chomp

  unless %w[0 1].include?(operator)
    error_message
    next
  end

  puts '0:左 | 1:右'
  print '向き: '
  direction = gets.chomp

  unless %w[0 1].include?(direction)
    error_message
    next
  end

  print 'シフト数: '
  shift = gets.to_i
  print '2進数: '
  num = gets.chomp

  if operator == '0'
    if direction == '0'
      puts left_logical_shift(num, shift)
    else
      puts right_logical_shift(num, shift)
    end
  end

  puts '' # 空行
end
