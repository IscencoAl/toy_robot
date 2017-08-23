require_relative '../command'
require_relative '../position'

module Commands
  class Move < ::Command
    def execute
      return unless valid?
      new_position = new_position()
      return unless @simulation.check_position(new_position[0], new_position[1])
      current_position = @simulation.robot.current_position
      current_position.update_attr(new_position[0], new_position[1])
    end

    def valid?
      @simulation.robot.placed?
    end

    private

    def new_position
      current_position = @simulation.robot.current_position
      direction = current_position.direction
      x = current_position.x
      y = current_position.y

      case direction
      when 'NORTH'
        [x, y + 1]
      when 'SOUTH'
        [x, y - 1]
      when 'WEST'
        [x - 1, y]
      when 'EAST'
        [x + 1, y]
      end
    end
  end
end
