# frozen_string_literal: true

a, b, c = gets.split.map(&:to_i)

aa = a**2
bb = b**2
cc = c**2

r = (aa + bb) < cc ? 'Yes' : 'No'

puts r
