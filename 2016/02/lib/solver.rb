require_relative 'keypad_factory'
require_relative 'parser'
require_relative 'traverser'

class Solver
  def initialize(input:, standard: false, output_stream: $stdout)
    @input = input
    if standard
      @keypad = KeypadFactory.make_standard
    else
      @keypad = KeypadFactory.make_exotic
    end

    @output_stream = output_stream
  end

  def solve!
    traverser = Traverser.new(keypad: keypad)
    code = ''

    Parser.new(input: input).moves.each do |moves|
      code << traverser.key_after_moves(moves)
    end

    output_stream.puts code
  end

  private

  attr_reader :input, :keypad, :output_stream
end