require_relative '../command'

module Commands
  class Left < ::Command
    def execute
      return unless valid?

      @simulation.robot.direction = direction_left
    end

    def valid?
      @simulation.robot.placed?
    end

    def direction_left
      Robot::DIRECTIONS[(Robot::DIRECTIONS.index(@simulation.robot.direction) - 1) % 4]
    end
  end
end
