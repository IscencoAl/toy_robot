require_relative 'table'
require_relative 'robot'

class RobotSimulation
  attr_reader :robot
  attr_reader :table

  def initialize(table: Table.new, robot: Robot.new)
    @table = table
    @robot = robot
  end

  def place(x, y, direction)
    robot.x = x
    robot.y = y
    robot.direction = direction
  end
end
