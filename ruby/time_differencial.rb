# frozen_string_literal: true

# 時刻の差分

puts '時間A'
print '時: '
h_a = gets.to_i

print '分: '
m_a = gets.to_i

print '秒: '
s_a = gets.to_i

puts '' # 空行

puts '時間B'
print '時: '
h_b = gets.to_i

print '分: '
m_b = gets.to_i

print '秒: '
s_b = gets.to_i

puts '' # 空行

# 計算
time_a = (h_a * 3600) + (m_a * 60) + s_a
time_b = (h_b * 3600) + (m_b * 60) + s_b

diff = if time_a > time_b
         time_a - time_b
       else
         time_b - time_a
       end

t = diff / 60

s = diff % 60
m = t % 60
h = t / 60

puts "差分: #{h}時間#{m}分#{s}秒"

# メソッド

time1 = Time.new(2000, nil, nil, h_a, m_a, s_a)
time2 = Time.new(2000, nil, nil, h_b, m_b, s_b)

diff = if time1 > time2
         time1 - time2
       else
         time2 - time1
       end

puts "差分: #{Time.at(diff).utc.strftime('%-H時間%-M分%-S秒')}"
