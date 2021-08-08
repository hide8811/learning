# frozen_string_literal: true

# シェルソート
# 挿入ソートの改良版。シェルさんが発明。
# 挿入ソートを複数の塊に分けて、近づけていく。

def h_array(data_length)
  h_ary = []
  h = 1

  max = (data_length / 9).zero? ? 1 : data_length / 9

  while max > h
    h_ary.push(h)
    h = h * 3 + 1
  end

  h_ary.reverse
end

puts '[数値の個数] or [数値を入力(半角スペース区切り)]'
print 'DATA: '
data = gets.split.map(&:to_i)

data = (1..data[0]).to_a.sample(data[0]) if data.length == 1

puts data.join(' ')

h_ary = h_array(data.length)

h_ary.each do |h|
  p "h: #{h}"
  (0..h - 1).each do |i|
    puts "First index: #{i}"
    while data.length - 1 > i + h
      target = data[i + h]
      puts "target: #{target}"
      blank = i + h
      j = i

      while j > -1
        if data[j] > target
          data[j + h] = data[j]
          blank = j
        end

        break if target > data[j]

        j -= h
      end

      data[blank] = target
      i += h
      puts data.join(' ')
    end
  end
end
