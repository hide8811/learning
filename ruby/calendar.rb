# frozen_string_literal: true

require 'Date'

def centering(str)
  str_count = str.length
  space_count = (20 - str_count) / 2

  space = ' ' * space_count

  if str_count.even?
    "┃#{space}#{str}#{space}┃"
  else
    "┃#{space}#{str}#{space} ┃"
  end
end

today = Date.today

# header
year = today.strftime('%Y')
month = today.strftime('%B')

header_str = "#{month} #{year}"

puts '┏━━━━━━━━━━━━━━━━━━━━┓'
puts centering(header_str)
puts '┣━━━━━━━━━━━━━━━━━━━━┫'

# body
puts '┃Su Mo Tu We Th Fr Sa┃'
puts '┠────────────────────┨'

first_day = Date.new(today.year, today.month, 1)
end_day = (first_day >> 1) - 1

one_month = Array.new(first_day.wday, '  ') + (1..end_day.day).map { |day| day <= 9 ? " #{day}" : day }

month_weeks = one_month.each_slice(7).to_a

month_weeks.map do |week|

  if week.length == 7
    print "┃#{week.join(' ')}┃\n"
  else
    last_week = week + Array.new((7 - week.length), '  ')
    print "┃#{last_week.join(' ')}┃\n"
    puts '┗━━━━━━━━━━━━━━━━━━━━┛'
  end
end


