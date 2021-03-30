# frozen_string_literal: true

def total_amount(x, y, z)
  (10_000 * x) + (5_000 * y) + (1_000 * z)
end

n, yen = gets.split.map(&:to_i)

x, y, z = 0, n, 0

while total_amount(x, y, z)
  if y.zero?
    x, y, z = -1, -1, -1
    break
  end

  if total_amount(x, y, z) > yen
    y -= 1
    x += 1

  else
    y -= 1
    x += 1
  end
end

puts "#{x} #{y} #{z}"
