# frozen_string_literal: true

count_a = gets.to_i
count_b = gets.to_i
count_c = gets.to_i
yen = gets.to_i

ary_a = (0..count_a).to_a
ary_b = (0..count_b).to_a
ary_c = (0..count_c).to_a

ary_x = ary_a.product(ary_b, ary_c)
just_x = ary_x.select { |x| ((500 * x[0]) + (100 * x[1]) + (50 * x[2])) == yen }

puts just_x.length
