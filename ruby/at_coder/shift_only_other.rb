# freezon_string_literal: true

n = gets.to_i
ary = gets.split.map(&:to_i)
shift_count = 0

while ary.all?(&:even?)
  ary.map!{ |num| num / 2 }
  shift_count += 1
end

puts shift_count
