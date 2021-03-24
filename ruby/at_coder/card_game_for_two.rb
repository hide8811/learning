# frozen_string_literal: true

gets.to_i
num_ary = gets.split.map(&:to_i)

alice = []
bob = []

num_ary.sort.reverse.each_with_index { |num, index| index.even? ? alice << num : bob << num }

puts alice.sum - bob.sum
