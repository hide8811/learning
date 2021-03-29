# frozen_string_literal: true

n, yen = gets.split.map(&:to_i)

content = nil

n.downto(0) do |x|
  x_remainder = yen - (10_000 * x)

  next if x_remainder.negative?

  0.upto(n - x) do |y|
    y_remainder = x_remainder - (5_000 * y)

    break if y_remainder.negative?

    z = n - x - y

    if y_remainder == 1_000 * z
      content = "#{x} #{y} #{z}"
      break
    end
  end

  break unless content.nil?
end

puts content.nil? ? '-1 -1 -1' : content
