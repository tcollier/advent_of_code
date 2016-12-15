require_relative '../coordinates'

module Move
  class Up
    def next_coords(keypad:, coords:)
      up_coords = Coordinates.new(coords.x, coords.y - 1)
      return keypad.key_at(up_coords) ? up_coords : coords
    end
  end
end