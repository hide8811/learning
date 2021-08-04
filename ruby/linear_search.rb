# frozen_string_literal: true

# リニアサーチ
# 先頭から順番に値があるかどうかを探す。

data = (0..9).to_a
result = Array.new(data.length, '-')

print '探す番号(0 〜 9): '
num = gets.chomp

unless num.match(/^\d$/)
  puts '入力は0〜9の数字です。'
  puts '' # 空行
  exit
end

num = num.to_i

data.each_with_index do |n, i|
  if n == num
    result[i] = 'o'
    break
  end
end

puts '結果:'
puts data.join(' ')
puts result.join(' ')
