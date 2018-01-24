class Robot
  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(x,y)
    @x_coordinate = x
    @y_coordinate = y
    @direction = "NORTH"
    @compass = ["NORTH","EAST","SOUTH","WEST"]
  end

  def report
      "#{@x_coordinate},#{@y_coordinate},#{@direction}"
  end

  def place(instruction)
    instruction_array  = instruction.split(",")
    return "invalid place instruction" if instruction_array[0] != "PLACE"

    @x_coordinate = instruction_array[1].to_i
    @y_coordinate = instruction_array[2].to_i
    @direction = instruction_array[3]
  end

  def move
    case direction
    when "NORTH"
      @y_coordinate+=1
    when "SOUTH"
      @y_coordinate-=1
    when "EAST"
      @x_coordinate+=1
    when "WEST"
      @x_coordinate-=1
    else
      "Invalid Move"
    end
  end

  def move_left
    @compass.rotate!(-1)
    @direction = @compass[0]
  end

  def move_right
    @compass.rotate!(1)
    @direction = @compass[0]
  end
end
