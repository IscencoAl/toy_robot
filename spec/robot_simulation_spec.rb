require 'spec_helper'
require 'robot_simulation'

describe RobotSimulation do
  describe '#new' do
    subject { described_class.new }

    it { is_expected.to be_a(RobotSimulation) }
  end

  let(:table) { Table.new(width: 5, height: 5) }
  let(:robot_simulation) { described_class.new(table: table) }
  let(:position) { Position.new(1, 2, 'NORTH') }

  describe '#place' do
    it 'assigne attributes to robot via position' do
      robot_simulation.place(position)
      expect(robot_simulation.robot.current_position.x).to eq(1)
      expect(robot_simulation.robot.current_position.y).to eq(2)
      expect(robot_simulation.robot.current_position.direction).to eq('NORTH')
    end
  end
end
