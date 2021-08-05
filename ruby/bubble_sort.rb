# frozen_string_literal: true

# バブルソート
# 隣り合う要素を比較し順番に並び替えていく。
# 要素が端から浮かび上がるように並び替えられる。

def max_length(ary)
  length = 0

  ary.each do |a|
    n_length = a.length
    length = n_length if n_length > length
  end

  length
end

def right_justified(ary)
  s_ary = ary.map(&:to_s)

  max_length = max_length(s_ary)

  s_ary.map! do |n|
    n_length = n.length

    n_length == max_length ? n : ' ' * (max_length - n_length) + n
  end

  s_ary.join(' ')
end

puts '数値を入力してください。(半角スペース区切り)'
print 'DATA: '
data = gets.split.map(&:to_i)

puts right_justified(data)

(0..(data.length - 1)).reverse_each do |l|
  (0..l - 1).each do |i|
    data[i], data[i + 1] = data[i + 1], data[i] if data[i] > data[i + 1]
    puts right_justified(data)
  end
end
