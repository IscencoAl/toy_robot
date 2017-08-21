class Table 

  def initialize(width: 5, height: 5)
    @width = width
    @height = height
  end

  def position_is_valid?(x,y)
    x.to_i < @width && y.to_i < @height && x.to_i >= 0 && y.to_i >= 0	
  end
end
