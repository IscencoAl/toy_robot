require 'spec_helper'
describe Commands::Left do
  let(:robot) { Robot.new }
  let(:simulation) { RobotSimulation.new }
  let(:left_command) { described_class.new(simulation: simulation, arguments: []) }
  describe '#valid?' do
    context 'when the robot has been placed' do
      before do
        simulation.place(0, 0, 'NORTH')
      end
      it { expect(left_command.valid?).to eq(true) }
    end

    context 'when the robot has not been placed' do
      it { expect(left_command.valid?).to eq(false) }
    end
  end

  describe '#execute' do
    context 'when the robot has been placed' do
      before do
        simulation.place(0, 0, 'NORTH')
      end
      it { expect(left_command.execute).to eq('WEST') }
    end

    context 'when the robot has not been placed' do
      it { expect(left_command.execute).to eq(nil) }
    end
  end
end
