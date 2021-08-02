# frozen_string_literal: true

require 'prime'

# 素因数分解

print '整数: '
num = gets.to_i

n = num
prime = 1
prime_ary = []

until n == 1
  prime += 1

  while (n % prime).zero?
    n /= prime
    prime_ary.push(prime)
  end
end

pri = prime_ary.uniq

count = pri.map { |e| prime_ary.count(e) }

solution = pri.zip(count)

solution.map! { |p, c| c == 1 ? p.to_s : "#{p}^#{c}" }

puts "解: #{solution.join(' × ')}"

# Primeライブラリ使用
sol = Prime.prime_division(num).map! { |p, c| c == 1 ? p.to_s : "#{p}^#{c}" }

puts "　 (#{sol.join(' × ')})"

puts solution == sol
