require_relative '../command'

module Commands
  class Right < ::Command
    def execute
      return unless valid?

      @simulation.robot.direction = direction_right
    end

    def valid?
      @simulation.robot.placed?
    end

    def direction_right
      Robot::DIRECTIONS[(Robot::DIRECTIONS.index(@simulation.robot.direction) + 1) % 4]
    end
  end
end
