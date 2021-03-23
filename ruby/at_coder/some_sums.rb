# frozen_string_literal: true

def each_digits_sum(num)
  ten_thousands_place = (num / 10_000) % 10
  thousands_place = (num / 1000) % 10
  hundreds_place = (num / 100) % 10
  tens_place = (num / 10) % 10
  ones_place = (num / 1) % 10
  ten_thousands_place + thousands_place + hundreds_place + tens_place + ones_place
end

n, a, b = gets.split.map(&:to_i)

match_ary = [*1..n].select do |num|
  num_sum = each_digits_sum(num)
  a <= num_sum && num_sum <= b
end

ary_sum = match_ary.sum

puts ary_sum
