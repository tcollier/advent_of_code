require_relative '../coordinates'

module Move
  class Left
    def next_coords(keypad:, coords:)
      left_coords = Coordinates.new(coords.x - 1, coords.y)
      return keypad.key_at(left_coords) ? left_coords : coords
    end
  end
end