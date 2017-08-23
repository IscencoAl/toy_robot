class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_accessor :x
  attr_accessor :y
  attr_accessor :direction

  def current_position
    if placed?
      [x, y, direction].join(',')
    else
      'not in place'
    end
  end

  def placed?
    !x.nil? && !y.nil? && !direction.nil?
  end
end
