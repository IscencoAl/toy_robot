class Robot
  attr_accessor :current_position

  def initialize
    @current_position = nil
  end

  def report
    if placed?
      [current_position.x, current_position.y, current_position.direction].join(',')
    else
      'not in place'
    end
  end

  def placed?
    !current_position.nil?
  end
end
