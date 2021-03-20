# frozen_string_literal: true

n = gets.to_i
ary = gets.split.map(&:to_i)
shift_count = 0

loop do
  ary = ary.each_with_object([]) { |num, new_ary| new_ary << (num / 2) if num.even? }
  ary.length == n ? shift_count += 1 : break
end

puts shift_count
