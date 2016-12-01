class Move
  attr_reader :steps

  def initialize(right:, steps:)
    @right = right
    @steps = steps
  end

  def right?
    @right
  end
end
