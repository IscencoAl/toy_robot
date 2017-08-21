require "spec_helper"
require "robot"

RSpec.describe Robot do
  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(Robot) }
  end

  let(:robot){ described_class.new}
  describe '#current_position' do

    it 'returns position when x and y and direction not nil' do
      robot.x = 3
      robot.y = 2
      robot.direction = "NORTH"
      expect(robot.current_position).to eq("3,2,NORTH")
    end

    it 'returns "not in place" if x or/and y or/and direction is nil' do
      robot.x = 3
      expect(robot.current_position).to eq('not in place')
    end
  end

  describe '#placed?' do

    it 'returns false if x or/and y or/and direction is nil' do
      robot.x = nil
      robot.direction = "WEST"
      robot.y = 0
      expect(robot.placed?).to be false
    end

    it 'returns true if x and y and direction not nil' do
      robot.x = 1
      robot.direction = "WEST"
      robot.y = 2
      expect(robot.placed?).to be true
    end
  end


end
