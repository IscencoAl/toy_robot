require_relative '../command'

module Commands
  class Report < ::Command
    def execute
      return unless valid?
      puts @simulation.robot.current_position
      @simulation.robot.current_position
    end

    def valid?
      @simulation.robot.placed?
    end
  end
end
