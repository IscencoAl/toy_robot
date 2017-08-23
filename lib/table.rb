class Table
  def initialize(width: nil, height: nil)
    @width = width
    @height = height
  end

  def position_is_valid?(x, y)
    x < @width && y < @height && x >= 0 && y >= 0
  end

  def no_obstacle?(x, y)
    obstacle = obstacle_coord
    !(x == obstacle[0] && y == obstacle[1])
  end

  def obstacle_coord
    [3, 4] # random obstacle
  end
end
