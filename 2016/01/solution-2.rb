#!/usr/bin/env ruby

module Solver
  DIRECTION_MOVER = [
    [1,  0],  # North
    [0,  1],  # East
    [-1, 0],  # South
    [0, -1]   # West
  ].freeze

  def self.solve(input)
    # 0 = North
    # 1 = East
    # 2 = South
    # 3 = West
    current_direction = 0
    visited = {
      [0, 0] => true
    }
    current_location = [0, 0]
    input.split(',').each do |dir|
      dir.strip!
      if dir[0] == 'R'
        current_direction += 1
      else
        current_direction -= 1
      end
      current_direction %= 4

      Integer(dir[1..-1]).times do
        current_location[0] += DIRECTION_MOVER[current_direction][0]
        current_location[1] += DIRECTION_MOVER[current_direction][1]

        if visited.key?(current_location)
          return current_location[0].abs + current_location[1].abs
        end

        visited[current_location] = true
      end
    end

    nil
  end
end

puts Solver.solve(ARGF.read)