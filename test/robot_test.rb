require_relative "../lib/robot/robot.rb"
require "minitest/autorun"

describe Robot do
  before do
    @robot = Robot.new(4,4)
  end

  describe 'when robot moves within grid' do
    it 'must return the x co-ordinate' do
      @robot.x_coordinate.must_equal 4
    end
    it 'must return the y co-ordinate' do
      @robot.y_coordinate.must_equal 4
    end
    it 'must return the direction' do
      @robot.direction.must_equal "NORTH"
    end
    it 'must report 4,4,NORTH' do
      @robot.report.must_equal "4,4,NORTH"
    end
    it "must move North correctly" do
      robot_1 = Robot.new(2,2)
      robot_1.place("PLACE,0,0,NORTH")
      robot_1.move
      robot_1.report.must_equal "0,1,NORTH"
    end
    it "must move East correctly" do
      robot_2 = Robot.new(5,5)
      robot_2.place("PLACE,2,2,EAST")
      robot_2.move
      robot_2.move
      robot_2.move
      robot_2.report.must_equal("5,2,EAST")
    end
    it "must move South correctly" do
      robot_3 = Robot.new(5,5)
      robot_3.place("PLACE,3,5,SOUTH")
      robot_3.move
      robot_3.move
      robot_3.report.must_equal("3,3,SOUTH")
    end
    it "must move West correctly" do
      robot_4 = Robot.new(5,5)
      robot_4.place("PLACE,4,2,WEST")
      robot_4.move
      robot_4.move
      robot_4.move
      robot_4.move
      robot_4.report.must_equal("0,2,WEST")
    end
    it "must move left correctly" do
      robot_5 = Robot.new(5,5)
      robot_5.place("PLACE,4,2,NORTH")
      robot_5.move_left
      robot_5.report.must_equal("4,2,WEST")
    end
    it "must move right correctly" do
      robot_6 = Robot.new(5,5)
      robot_6.place("PLACE,4,2,NORTH")
      robot_6.move_right
      robot_6.move_right
      robot_6.report.must_equal("4,2,SOUTH")
    end
    it "must rotate correctly left and right" do
      robot_7 = Robot.new(5,5)
      robot_7.place("PLACE,4,2,NORTH")
      robot_7.move_right
      robot_7.move_right
      robot_7.move_left
      robot_7.move_right
      robot_7.move_left
      robot_7.report.must_equal("4,2,EAST")
    end
    it "must move and rotate correctly" do
      robot_8 = Robot.new(5,5)
      robot_8.place("PLACE,3,2,NORTH")
      robot_8.move_left
      robot_8.move
      robot_8.move
      robot_8.move_left
      robot_8.move
      robot_8.report.must_equal("1,1,SOUTH")

    end
  end

  describe 'when robot falls off the grid' do
    it 'must report off the grid' do
    end
  end

  describe 'when user inputs an invalid command' do
    it 'must report as invalid input'do
    end
  end
end
