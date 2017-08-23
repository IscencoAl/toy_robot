require_relative '../command'

module Commands
  class Move < ::Command
    def execute
      return unless valid?

      new_position = new_position()

      return unless @simulation.table.position_is_valid?(new_position[0], new_position[1])
      @simulation.robot.x = new_position[0]
      @simulation.robot.y = new_position[1]
    end

    def valid?
      @simulation.robot.placed?
    end

    private

    def new_position
      robot = @simulation.robot

      case robot.direction
      when 'NORTH'
        [robot.x, robot.y + 1]
      when 'SOUTH'
        [robot.x, robot.y - 1]
      when 'WEST'
        [robot.x - 1, robot.y]
      when 'EAST'
        [robot.x + 1, robot.y]
      end
    end
  end
end
