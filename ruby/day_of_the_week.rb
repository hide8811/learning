require 'date'
require 'benchmark'

puts '年月日を入力 xxxx/xx/xx'

year, month, day = gets.split('/').map(&:to_i)

weekday = %w(日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日)

Benchmark.bm(7) do |x|
  # wday ====================================
  x.report do
    n = Date.new(year, month, day).wday

    puts '--wdayメソッド--'
    puts weekday[n]
  end

  # ツェラーの公式 =========================
  x.report do
    if month <= 2
      year -= 1
      month += 12
    end

    h = (year + (year / 4) - (year / 100) + (year / 400) + (((13 * month) + 8) / 5) + day) % 7

    puts '--ツェラーの公式--'
    puts weekday[h]
  end
end
