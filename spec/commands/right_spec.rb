require 'spec_helper'
describe Commands::Right do
  let(:robot) { Robot.new }
  let(:simulation) { RobotSimulation.new }
  let(:right_command) { described_class.new(simulation: simulation, arguments: []) }
  describe '#valid?' do
    context 'when the robot has been placed' do
      before do
        simulation.place(Position.new(0, 0, 'NORTH'))
      end
      it { expect(right_command.valid?).to eq(true) }
    end

    context 'when the robot has not been placed' do
      it { expect(right_command.valid?).to eq(false) }
    end
  end

  describe '#execute' do
    context 'when the robot has been placed' do
      before do
        simulation.place(Position.new(0, 0, 'NORTH'))
      end
      it { expect(right_command.execute).to eq('EAST') }
    end

    context 'when the robot has not been placed' do
      it { expect(right_command.execute).to eq(nil) }
    end
  end
end
