class Coordinates
  attr_reader :east, :north

  def initialize(east:, north:)
    @east = east
    @north = north
  end

  def ==(other)
    return false unless other.is_a?(self.class)
    east == other.east && north == other.north
  end

  def eql?(other)
    self == other
  end

  def hash
    [east, north].hash
  end
end