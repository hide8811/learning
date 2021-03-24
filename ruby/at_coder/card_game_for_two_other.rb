# frozen_string_literal: true

gets
num_ary = gets.split.map(&:to_i).sort.reverse

difference = num_ary.each_with_index.inject(0) { |sum, (num, index)| index.even? ? sum + num : sum - num }

puts difference
