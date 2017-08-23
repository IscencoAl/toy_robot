require_relative '../command'
require_relative '../position'

module Commands
  class Left < ::Command
    def execute
      return unless valid?
      position = @simulation.robot.current_position
      position.update_direction(direction_left)
    end

    def valid?
      @simulation.robot.placed?
    end

    def direction_left
      directions = Position::DIRECTIONS
      current_direction = @simulation.robot.current_position.direction
      directions[(directions.index(current_direction) - 1) % 4]
    end
  end
end
