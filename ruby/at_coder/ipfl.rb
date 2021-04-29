# frozen_string_literal: true

n = gets.to_i
s = gets.chomp
q = gets.to_i

s_first_half, s_second_half = s.chars.each_slice(n).to_a

q.times do
  t, a, b = gets.split.map(&:to_i)

  if t == 1
    a_ary = a <= n ? s_first_half : s_second_half
    b_ary = b <= n ? s_first_half : s_second_half

    a -= a <= n ? 1 : (1 + n)
    b -= b <= n ? 1 : (1 + n)

    a_ary[a], b_ary[b] = b_ary[b], a_ary[a]
  else
    s_first_half, s_second_half = s_second_half, s_first_half
  end
end

puts [s_first_half, s_second_half].join

# 別解 ========================================
#
# 文字列より数値の方が処理が早い。
# bytes[unpack('c*')]で数値に変換。pack('c*')で戻す。

n = gets.to_i
s = gets.chomp
q = gets.to_i

s_first_half, s_second_half = s.bytes.each_slice(n).to_a

q.times do
  t, a, b = gets.split.map(&:to_i)

  if t == 1
    a_ary = a <= n ? s_first_half : s_second_half
    b_ary = b <= n ? s_first_half : s_second_half

    a -= a <= n ? 1 : (1 + n)
    b -= b <= n ? 1 : (1 + n)

    a_ary[a], b_ary[b] = b_ary[b], a_ary[a]
  else
    s_first_half, s_second_half = s_second_half, s_first_half
  end
end

puts [s_first_half, s_second_half].flatten.pack('c*')
