# frozen_string_literal: true

a, b = gets.split.map(&:to_i)

print((a * b).even? ? 'Even' : 'Odd')
