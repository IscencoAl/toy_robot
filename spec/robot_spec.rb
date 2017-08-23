require 'spec_helper'
require 'robot'

describe Robot do
  describe '#new' do
    subject { described_class.new }

    it { is_expected.to be_a(Robot) }
  end

  let(:robot) { described_class.new }
  describe '#report' do
    context 'valid position' do
      let(:position) { Position.new(3, 2, 'NORTH') }
      it 'returns position when x and y and direction not nil' do
        robot.current_position = position
        expect(robot.report).to eq('3,2,NORTH')
      end
    end
    context 'wrong position' do
      it 'returns "not in place" if x or/and y or/and direction is nil' do
        robot.current_position = nil
        expect(robot.report).to eq('not in place')
      end
    end
  end

  describe '#placed?' do
    context 'wrong position' do
      it 'returns false if x or/and y or/and direction is nil' do
        robot.current_position = nil
        expect(robot.placed?).to be false
      end
    end

    context 'valid position' do
      let(:position) { Position.new(1, 2, 'WEST') }
      it 'returns true if x and y and direction not nil' do
        robot.current_position = position
        expect(robot.placed?).to be true
      end
    end
  end
end
