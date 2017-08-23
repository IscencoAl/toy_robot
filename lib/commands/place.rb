require_relative '../command'
require_relative '../position'

module Commands
  class Place < ::Command
    def execute
      return unless valid?
      @simulation.place(@position)
    end

    def valid?
      return false unless create_position
      x = @position.x
      y = @position.y
      direction = @position.direction
      @simulation.check_position(x, y) && valid_direction?(direction)
    end

    private

    def create_position
      x = @arguments[0]
      y = @arguments[1]
      d = @arguments[2]
      return false unless x.to_i.to_s == x || y.to_i.to_s == y
      @position = Position.new(x.to_i, y.to_i, d)
    end

    def valid_direction?(direction)
      Position::DIRECTIONS.include?(direction)
    end
  end
end
