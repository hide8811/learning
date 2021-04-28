# frozen_string_literal: true

n = gets.to_i
txy = n.times.map { gets.split.map(&:to_i) }

tt = xx = yy = 0

txy.each do |t, x, y|
  tt = t - tt
  xx = x - xx
  yy = y - yy

  sum = (xx.abs + yy.abs)

  if tt >= sum && tt.even? == sum.even?
    @answer = 'Yes'
  else
    @answer = 'No'
    break
  end
end

puts @answer
