require_relative '../coordinates'

module Move
  class Down
    def next_coords(keypad:, coords:)
      down_coords = Coordinates.new(coords.x, coords.y + 1)
      return keypad.key_at(down_coords) ? down_coords : coords
    end
  end
end