require_relative '../command'

module Commands
  class Report < ::Command
    def execute
      return unless valid?
      puts @simulation.robot.report
      @simulation.robot.report
    end

    def valid?
      @simulation.robot.placed?
    end
  end
end
