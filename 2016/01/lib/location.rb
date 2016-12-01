require_relative 'coordinates'

class Location
  def initialize
    @bearing = Bearing.new
    @east_coordinate = 0
    @north_coordinate = 0
  end

  def move!(move)
    bearing.turn!(right: move.right?)
    move.steps.times do
      self.east_coordinate += bearing.easterly_step
      self.north_coordinate += bearing.northerly_step

      yield coordinates
    end
  end

  def coordinates
    Coordinates.new(east: east_coordinate, north: north_coordinate)
  end

  private

  attr_reader :bearing

  attr_accessor :east_coordinate, :north_coordinate
end