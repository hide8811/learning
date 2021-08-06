# frozen_string_literal: true

# 選択ソート
# 要素を一つづつ比較していき、その中の最小値(最大値)と入れ替える。
# 交換の手順が一回のみのため、バブルソートよりも若干早い。

def max_length(ary)
  length = 0

  ary.each do |n|
    n_length = n.length
    length = n_length if n_length > length
  end

  length
end

def right_justified(array)
  ary = array.map(&:to_s)

  max_length = max_length(ary)

  ary.map! do |n|
    n_length = n.length

    n_length == max_length ? n : ' ' * (max_length - n_length) + n
  end

  ary.join(' ')
end

puts '数値を入力(半角スペース区切り)'
print 'DATA: '
data = gets.split.map(&:to_i)

puts right_justified(data)

data_length = data.length

(0..data_length - 1).each do |i|
  min = i

  ((i + 1)..(data_length - 1)).each do |c|
    min = c if data[min] > data[c]
  end

  data[i], data[min] = data[min], data[i] unless i == min

  puts right_justified(data)
end
