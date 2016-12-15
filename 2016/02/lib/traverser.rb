class Traverser
  def initialize(keypad:, initial_coords: nil)
    @keypad = keypad
    @coords = initial_coords || keypad.coords_for('5')
  end

  def key_after_moves(moves)
    moves.each do |move|
      self.coords = move.next_coords(keypad: keypad, coords: coords)
    end
    keypad.key_at(coords)
  end

  private

  attr_reader :keypad

  attr_accessor :coords
end