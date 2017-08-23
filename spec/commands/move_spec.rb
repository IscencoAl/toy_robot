require 'spec_helper'
describe Commands::Move do
  let(:robot) { Robot.new }
  let(:simulation) { RobotSimulation.new }
  let(:move_command) { described_class.new(simulation: simulation, arguments: []) }
  describe '#valid?' do
    context 'when the robot has been placed' do
      before do
        simulation.place(0, 0, 'NORTH')
      end
      it { expect(move_command.valid?).to eq(true) }
    end

    context 'when the robot has not been placed' do
      it { expect(move_command.valid?).to eq(false) }
    end
  end

  describe '#execute' do
    context 'when the robot has been placed' do
      before do
        simulation.place(0, 0, 'NORTH')
      end
      it 'expect updated coordinates' do
        move_command.execute
        expect(simulation.robot.current_position).to eq('0,1,NORTH')
      end
    end

    context 'when the robot has not been placed' do
      it { expect(move_command.execute).to eq(nil) }
    end
  end
end
