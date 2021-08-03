# frozen_string_literal: true

# スタック
# LIFO(Last In First Out) 最後に入れたものを最初に取り出す。
#
# push: データを入れる
# pop: データを取り出す

def disassembly(val)
  value = val.split
  flag = value.shift

  value = value[0].to_i if flag == 'pop'

  [flag, value]
end

data = []

loop do
  puts "データ: #{data}"
  puts '[push 要素 要素...]:追加 | [pop 数]: 取り出し | [e]: 終了(exit)'
  print '入力: '
  val = gets.chomp

  exit if val == 'e'

  unless val.match(/^push /) || val.match(/^pop \d+/)
    puts 'error: push or pop or e'
    puts '' # 空行
    next
  end

  flag, value = disassembly(val)

  if flag == 'push'
    data += value
  else
    if value > data.length
      puts 'error: 要素が足りません。'
      puts '' # 空行
      next
    end

    pop_val = []

    value.times { pop_val << data.pop }

    puts pop_val
  end

  puts '' # 空行
end
