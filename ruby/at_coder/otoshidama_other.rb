# frozen_string_literal: true

def total_amount(x_num, y_num, z_num)
  (10_000 * x_num) + (5_000 * y_num) + (1_000 * z_num)
end

n, yen = gets.split.map(&:to_i)

x = 0
y = n
z = 0

while total_amount(x, y, z) != yen
  if y.zero?
    x = y = z = -1
    break
  end

  if total_amount(x, y, z) > yen
    y -= 1
    z += 1

  else
    y -= 1
    x += 1
  end
end

puts "#{x} #{y} #{z}"
