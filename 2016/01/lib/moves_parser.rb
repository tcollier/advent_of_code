require_relative 'move'

class MovesParser
  def initialize(input:)
    @input = input
  end

  def moves
    input.split(',').map do |move|
      move.strip!
      Move.new(right: move[0] == 'R', steps: Integer(move[1..-1]))
    end
  end

  private

  attr_reader :input
end
