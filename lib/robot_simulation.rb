require_relative 'table'
require_relative 'robot'

class RobotSimulation
  attr_reader :robot
  attr_reader :table

  def initialize(table: nil, robot: Robot.new)
    @table = table
    @robot = robot
  end

  def place(position)
    robot.current_position = position
  end

  def check_position(x, y)
    table.position_is_valid?(x, y) && table.no_obstacle?(x, y)
  end
end
