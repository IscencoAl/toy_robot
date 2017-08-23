class Position
  attr_accessor :x
  attr_accessor :y
  attr_accessor :direction

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(x, y, d)
    @x = x
    @y = y
    @direction = d
  end

  def update_direction(new_direction)
    @direction = new_direction
  end

  def update_attr(new_x, new_y)
    @x = new_x
    @y = new_y
  end
end
