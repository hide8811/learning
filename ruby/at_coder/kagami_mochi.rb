# frozen_string_literal: true

n = gets.to_i
ary = Array.new(n) { gets.to_i }

stack = ary.uniq.length

puts stack
