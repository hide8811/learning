# frozen_string_literal: true

s = gets.chomp

%w[eraser erase dreamer dream].each { |w| s.gsub!(w, '') }

puts s == '' ? 'YES' : 'NO'
