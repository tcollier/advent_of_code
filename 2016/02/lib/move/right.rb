require_relative '../coordinates'

module Move
  class Right
    def next_coords(keypad:, coords:)
      right_coords = Coordinates.new(coords.x + 1, coords.y)
      return keypad.key_at(right_coords) ? right_coords : coords
    end
  end
end