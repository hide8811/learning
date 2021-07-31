# frozen_string_literal: true

def operator_get
  puts '[0]:論理シフト | [1]:算術シフト | [e]:終了(exit)'
  print 'シフト演算: '
  gets.chomp
end

def direction_get
  puts '[0]:左 | [1]:右'
  print '向き: '
  gets.chomp
end

def error_message
  puts 'error'
  puts '' # 空行
end

def shift_num_get
  print 'シフト数: '
  shift = gets.to_i
  print '2進数: '
  num = gets.chomp

  [shift, num]
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
# 左シフト
def left_arithmetic_shift(num, shift)
  num_ary = num.to_s.split('')

  sign = num_ary.shift

  num_ary.shift(shift)
  num_ary += Array.new(shift, '0')

  num_ary.unshift(sign).join
end

# 右シフト
def right_arithmetic_shift(num, shift)
  num_ary = num.to_s.split('')

  sign = num_ary.shift
  p sign

  num_ary.pop(shift)
  p num_ary
  num_ary = Array.new(shift, sign) + num_ary

  num_ary.unshift(sign).join
end

loop do
  operator = operator_get

  exit if %w[e exit].include?(operator)

  unless %w[0 1].include?(operator)
    error_message
    next
  end

  direction = direction_get

  unless %w[0 1].include?(direction)
    error_message
    next
  end

  shift, num = shift_num_get

  case [operator, direction]
  when %w[0 0]
    puts left_logical_shift(num, shift)
  when %w[0 1]
    puts right_logical_shift(num, shift)
  when %w[1 0]
    puts left_arithmetic_shift(num, shift)
  when %w[1 1]
    puts right_arithmetic_shift(num, shift)
  end

  puts '' # 空行
end
