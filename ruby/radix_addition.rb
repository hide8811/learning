# frozen_string_literal: true

radix = gets.to_i

# 1234+5678
formula = gets.chomp

left, right = formula.split('+')

if left.length > right.length
  diff = left.length - right.length
  right = ('0' * diff) + right
elsif right.length > left.length
  diff = right.length - left.length
  left = ('0' * diff) + left
end

left = left.split('').map(&:to_i)
right = right.split('').map(&:to_i)

ary = left.zip(right).reverse

carry = 0

ary.map! do |a|
  tmp = a.sum + carry

  if tmp >= radix
    tmp -= radix
    carry = 1
  else
    carry = 0
  end

  tmp
end

ary.reverse!

ary.unshift(1) if carry == 1

puts ary.join
