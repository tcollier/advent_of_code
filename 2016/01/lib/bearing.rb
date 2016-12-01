class Bearing
  def initialize
    # 0 = North
    # 1 = East
    # 2 = South
    # 3 = West
    self.direction = 0
  end

  def turn!(right:)
    if right
      self.direction += 1
    else
      self.direction -= 1
    end
    self.direction %= 4
  end

  def northerly_step
    case direction
    when 0 then 1
    when 2 then -1
    else 0
    end
  end

  def easterly_step
    case direction
    when 1 then 1
    when 3 then -1
    else 0
    end
  end

  private

  attr_accessor :direction
end
