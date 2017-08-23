require 'spec_helper'
require 'robot_simulation'

describe RobotSimulation do
  describe '#new' do
    subject { described_class.new }

    it { is_expected.to be_a(RobotSimulation) }
  end

  let(:robot_simulation) { described_class.new }

  describe '#place' do
    it 'assigne attributes to robot' do
      expect(robot_simulation.robot).to receive(:x=).with(1)
      expect(robot_simulation.robot).to receive(:y=).with(2)
      expect(robot_simulation.robot).to receive(:direction=).with('NORTH')
      robot_simulation.place(1, 2, 'NORTH')
    end
  end
end
