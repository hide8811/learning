# frozen_string_literal: true

n, a, b = gets.split.map(&:to_i)

ary = (1..n).select do |x|
  sum = x.digits.sum
  a <= sum && sum <= b
end

ary_sum = ary.sum

p ary_sum
