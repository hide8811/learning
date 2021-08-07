# frozen_string_literal: true

# 挿入ソート
# 正しい位置に入れていく。
# 人が並べ替えを行う時に近い考え方。

puts '数値を入力(半角スペース区切り)'
print 'DATA: '
data = gets.split.map(&:to_i)

(1..data.length - 1).each do |i|
  target = data[i]
  blank = i

  (0..i - 1).reverse_each do |x|
    if data[x] > target
      data[x + 1] = data[x]
      blank = x
    end

    break if target > data[x]
  end

  data[blank] = target

  puts data.join(' ')
end
