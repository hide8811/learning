# frozen_string_literal: true

a_num, b_num, c_num, x = readlines.map(&:to_i)
count = 0

(0..a_num).each do |a|
  (0..b_num).each do |b|
    n = (x - (500 * a) - (100 * b)) / 50

    break if n.negative?
    next if c_num < n

    count += 1
  end
end

puts count
