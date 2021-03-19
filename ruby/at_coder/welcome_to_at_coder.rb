# frozen_string_literal: true

a = gets.to_i
b, c = gets.split.map(&:to_i)
s = gets.chomp

num_sum = a + b + c

puts "#{num_sum} #{s}"
