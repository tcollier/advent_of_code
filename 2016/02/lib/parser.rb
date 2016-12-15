require_relative 'move/down'
require_relative 'move/left'
require_relative 'move/right'
require_relative 'move/up'

class Parser
  def initialize(input:)
    @input = input
  end

  def moves
    input.strip.split("\n").map do |line|
      line.chars.map do |char|
        case char
        when 'D' then Move::Down.new
        when 'L' then Move::Left.new
        when 'R' then Move::Right.new
        when 'U' then Move::Up.new
        end
      end
    end
  end

  private

  attr_reader :input
end