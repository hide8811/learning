# frozen_string_literal: true

# エラトステネスのふるい
# 指定された整数以下の素数を求めるアルゴリズム
# 1を除く小さな数から順に指定し、選んだ数の倍数を消していく。
# 消されていない数値を選び倍数を消すを繰り返し、残ったものが素数。

require 'prime'

print '範囲: ~ '
n = gets.to_i

if [0, 1].include?(n)
  puts 'error'
  exit
end

ary = (2..n).to_a

prime = []

while ary[0]
  p = ary[0]

  prime.push(p)

  ary.delete_if { |a| (a % p).zero? }
end

puts "素数: #{prime.join(' ')}"

m_prime = Prime.each(n).to_a

puts "　　 (#{Prime.each(n).to_a.join(' ')})"

puts prime == m_prime
