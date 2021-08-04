# frozen_string_literal: true

# バイナリサーチ(二分探索)
# データを半分づつ確認し、絞り込んでいく。
#
# 注）データがソートされていないと検索できない。

data = (1..20).to_a
result = Array.new(9, '-') + Array.new(11, ' -')

print '検索する数値: '
num = gets.to_i

flag = false

first = 0
last = data.length - 1

until first > last
  middle = (first + last) / 2

  if data[middle] == num
    result[middle] = 1
    flag = true
    break
  elsif data[middle] > num
    last = middle - 1
  else
    first = middle + 1
  end
end

puts data.join(' ')
puts result.join(' ')
puts 'データが存在しません。' unless flag
