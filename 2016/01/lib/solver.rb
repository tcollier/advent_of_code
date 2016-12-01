require_relative 'distance_calculator'
require_relative 'moves_parser'
require_relative 'traverser'

class Solver
  def initialize(input:, output_stream: $stdout)
    @input = input
    @output_stream = output_stream
  end

  def solve!
    calculator = DistanceCalculator.new
    traverser = Traverser.new(moves: MovesParser.new(input: input).moves)
    traverser.traverse!

    output_stream.puts "Ending at distance: #{calculator.distance(traverser.final_coordinates)}"

    if traverser.first_multiple_visit_coordinates.nil?
      output_stream.puts "No squares covered twice"
    else
      message = <<-MSG
        First double visited square at distance:
        #{calculator.distance(traverser.first_multiple_visit_coordinates)}
      MSG
      output_stream.puts message.strip.gsub(/\s+/, ' ')
    end
  end

  private

  attr_reader :input, :output_stream
end
