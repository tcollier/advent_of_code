#!/usr/bin/env ruby

module Solver
  def self.solve(input)
    # 0 = North
    # 1 = East
    # 2 = South
    # 3 = West
    current_direction = 0
    directions_totals = [0, 0, 0, 0]
    input.split(',').each do |dir|
      dir.strip!
      if dir[0] == 'R'
        current_direction += 1
      else
        current_direction -= 1
      end
      current_direction %= 4
      directions_totals[current_direction] += Integer(dir[1..-1])
    end
    (directions_totals[0] - directions_totals[2]).abs + (directions_totals[1] - directions_totals[3]).abs
  end
end

puts Solver.solve(ARGF.read)