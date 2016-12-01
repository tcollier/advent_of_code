require_relative 'bearing'
require_relative 'location'

class Traverser
  def initialize(moves:)
    @moves = moves
  end

  def traverse!
    @location = Location.new
    @multiple_visit_coordinates = []
    visited = { location.coordinates => true }

    moves.each do |move|
      location.move!(move) do |coordinates|
        if visited.key?(coordinates)
          multiple_visit_coordinates << coordinates
        else
          visited[coordinates] = true
        end
      end
    end
  end

  def final_coordinates
    raise "You must #traverse! before calling #{__method__}" unless traversed?

    location.coordinates
  end

  def first_multiple_visit_coordinates
    raise "You must #traverse! before calling #{__method__}" unless traversed?

    multiple_visit_coordinates.first
  end

  private

  attr_reader :location, :moves, :multiple_visit_coordinates

  def traversed?
    !location.nil?
  end
end
