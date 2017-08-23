require_relative '../command'

module Commands
  class Place < ::Command
    def execute
      return unless valid?
      @simulation.place(@x.to_i, @y.to_i, @direction)
    end

    def valid?
      valid_table_position? && valid_direction?
    end

    private

    def valid_table_position?
      @x = @arguments[0]
      @y = @arguments[1]
      return false unless @x.to_i.to_s == @x || @y.to_i.to_s == @y
      @simulation.table.position_is_valid?(@x, @y)
    end

    def valid_direction?
      @direction = @arguments[2]
      Robot::DIRECTIONS.include?(@direction)
    rescue NoMethodError
      false
    end
  end
end
