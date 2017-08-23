require_relative '../command'
require_relative '../position'

module Commands
  class Right < ::Command
    def execute
      return unless valid?
      position = @simulation.robot.current_position
      position.update_direction(direction_right)
    end

    def valid?
      @simulation.robot.placed?
    end

    def direction_right
      directions = Position::DIRECTIONS
      current_direction = @simulation.robot.current_position.direction
      directions[(directions.index(current_direction) + 1) % 4]
    end
  end
end
