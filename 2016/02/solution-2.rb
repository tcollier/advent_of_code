#!/usr/bin/env ruby

module Solver
  KEYPAD = [
    nil,
    [nil, nil, nil, '1'],
    [nil, nil, '2', '3', '4'],
    [nil, '5', '6', '7', '8', '9'],
    [nil, nil, 'A', 'B', 'C'],
    [nil, nil, nil, 'D']
  ].freeze

  def self.solve(input)
    coords = [1, 3]
    code = ''
    input.strip.split("\n").each do |command|
      command.chars.each do |dir|
        case dir
        when 'U'
          coords[1] -= 1 unless KEYPAD[coords[1] - 1].nil? || KEYPAD[coords[1] - 1][coords[0]].nil?
        when 'D'
          coords[1] += 1 unless KEYPAD[coords[1] + 1].nil? || KEYPAD[coords[1] + 1][coords[0]].nil?
        when 'L'
          coords[0] -= 1 unless KEYPAD[coords[1]][coords[0] - 1].nil?
        when 'R'
          coords[0] += 1 unless KEYPAD[coords[1]][coords[0] + 1].nil?
        end
      end
      code << KEYPAD[coords[1]][coords[0]].to_s
    end
    code
  end
end

puts Solver.solve(ARGF.read)