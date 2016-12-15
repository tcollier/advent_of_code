require_relative 'keypad'

module KeypadFactory
  module KeyMatrix
    STANDARD = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ].freeze

    EXOTIC = [
      %w[. . 1 . .],
      %w[. 2 3 4 .],
      %w[5 6 7 8 9],
      %w[. A B C .],
      %w[. . D . .]
    ].freeze
  end
  private_constant :KeyMatrix

  def self.make_standard
    Keypad.new(key_matrix: KeyMatrix::STANDARD)
  end

  def self.make_exotic
    Keypad.new(key_matrix: KeyMatrix::EXOTIC)
  end
end