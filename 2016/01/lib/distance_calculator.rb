require_relative 'coordinates'

class DistanceCalculator
  def initialize(origin: Coordinates.new(east: 0, north: 0))
    @origin = origin
  end

  def distance(coordinates)
    (coordinates.east - origin.east).abs + (coordinates.north - origin.north).abs
  end

  private

  attr_reader :origin
end