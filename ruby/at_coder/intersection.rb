# frozen_string_literal: true

gets.to_i
a_ary = gets.split.map(&:to_i)
b_ary = gets.split.map(&:to_i)

ary = [a_ary, b_ary].transpose.map { |t| (t[0]..t[1]).to_a }

answer = ary.inject { |r, n| r & n }.length

puts answer

# 別解 =====================

gets
a = gets.split.map(&:to_i).max
b = gets.split.map(&:to_i).min

s = b - a + 1

puts s.positive? ? s : 0
