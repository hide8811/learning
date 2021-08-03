# frozen_string_literal: true

# キュー
# FIFO(First In First Out) 最初に入れたものを最初に取り出す。
#
# enqueue: データの追加
# dequeue: データの取り出し

data = []

loop do
  puts "Data: #{data}"
  puts '[en 要素 要素...]: 追加(enqueue) | [de 数]: 取り出し(dequeue) | [e]: 終了(exit)'
  print '入力: '
  val = gets.chomp

  exit if val == 'e'

  unless val.match(/^en /) || val.match(/^de \d+/)
    puts 'error: [en] or [de] or [e]'
    puts '' # 空行
    next
  end

  value = val.split
  flag = value.shift

  if flag == 'en'
    data += value
  else
    num = value[0].to_i

    if num > data.length
      puts 'error: 要素が足りません。'
      puts '' # 空行
      next
    end

    puts data.shift(num)
  end

  puts '' # 空行
end
