# frozen_string_literal: true

# カラオケマシーン
class KaraokeMachine
  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    new_melody =
      make_ary(@melody).map do |m|
        if [' ', '|'].include?(m)
          m
        else
          key_change(m, amount)
        end
      end

    new_melody.join
  end

  private

  def key_change(note, amount)
    keys = %w[C C# D D# E F F# G G# A A# B]

    i = keys.index(note)
    i += amount

    i += keys.length while i.negative?
    i -= keys.length while i >= keys.length

    keys[i]
  end

  def make_ary(melody)
    melody_ary = melody.split('')

    sharp_index = melody_ary.filter_map.with_index { |m, i| i if m == '#' }
    sharp_index.each { |s| melody_ary[s - 1] += '#' }

    melody_ary.delete('#')

    melody_ary
  end
end
