#!/usr/bin/env ruby

module Solver
  KEYPAD = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ].freeze

  def self.solve(input)
    coords = [1, 1]
    code = ''
    input.strip.split("\n").each do |command|
      command.chars.each do |dir|
        case dir
        when 'U'
          coords[1] -= 1 if coords[1] > 0
        when 'D'
          coords[1] += 1 if coords[1] < 2
        when 'L'
          coords[0] -= 1 if coords[0] > 0
        when 'R'
          coords[0] += 1 if coords[0] < 2
        end
      end
      code << KEYPAD[coords[1]][coords[0]].to_s
    end
    code
  end
end

puts Solver.solve(ARGF.read)