# frozen_string_literal: true

a, b, c, x = readlines.map(&:to_i)

ary = (0..a).to_a.product((0..b).to_a, (0..c).to_a)

count = ary.count { |y| ((500 * y[0]) + (100 * y[1]) + (50 * y[2])) == x }

puts count
