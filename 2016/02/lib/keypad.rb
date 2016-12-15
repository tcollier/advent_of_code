require_relative 'coordinates'

class Keypad
  EMPTY_KEY_MARKER = '.'.freeze
  private_constant :EMPTY_KEY_MARKER

  def initialize(key_matrix:)
    @key_matrix = key_matrix
  end

  def key_at(coords)
    if coords.y < 0 || coords.y >= key_matrix.size
      nil
    elsif coords.x < 0 || coords.x >= key_matrix[coords.y].size
      nil
    elsif key_matrix[coords.y][coords.x] == EMPTY_KEY_MARKER
      nil
    else
      key_matrix[coords.y][coords.x]
    end
  end

  def coords_for(key)
    coords = nil
    key_matrix.detect.with_index do |row, coords_y|
      key_matrix[coords_y].detect.with_index do |k, coords_x|
        coords = Coordinates.new(coords_x, coords_y) if k == key
      end
    end

    raise ArgumentError, "Key not found on keypad: #{key}" unless coords
    coords
  end

  private

  attr_reader :key_matrix
end