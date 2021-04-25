# frozen_string_literal: true

require 'Date'

today = Date.today

year = today.strftime('%Y')
month = today.strftime('%B')
month_year = "#{month} #{year}"

header_string = month_year.center(20)

puts '┏━━━━━━━━━━━━━━━━━━━━┓'
puts "┃#{header_string}┃"
puts '┣━━━━━━━━━━━━━━━━━━━━┫'
puts '┃Su Mo Tu We Th Fr Sa┃'
puts '┠────────────────────┨'

first_date = Date.new(today.year, today.month, 1)
last_date = (first_date >> 1) - 1
date_array = (1..last_date.day).map { |day| format('%2d', day) }

one_month = Array.new(first_date.wday, '  ') + date_array + Array.new(6 - last_date.wday, '  ')

one_month.each_slice(7) { |week| puts "┃#{week.join(' ')}┃" }

puts '┗━━━━━━━━━━━━━━━━━━━━┛'
