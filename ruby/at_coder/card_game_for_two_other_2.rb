# frozen_string_literal: true

gets
num_ary = gets.split.map(&:to_i).sort.reverse

alice_ary, bob_ary = num_ary.partition.with_index { |_, index| index.even? }

difference = alice_ary.sum - bob_ary.sum

puts difference
