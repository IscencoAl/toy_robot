require 'spec_helper'
describe Commands::Place do
  let(:robot) { Robot.new }
  let(:simulation) { RobotSimulation.new(table: Table.new(width: 5, height: 5)) }

  describe '#valid_direction?' do
    context 'when valid arguments' do
      let(:place_command) { described_class.new(simulation: simulation, arguments: %w[3 3 NORTH]) }
      it { expect(place_command.send(:valid_direction?, 'NORTH')).to eq(true) }
    end

    context 'when not valid arguments' do
      let(:place_command) { described_class.new(simulation: simulation, arguments: ['3', '3', 'BLA BLA']) }
      it { expect(place_command.send(:valid_direction?, 'BLA BLA')).to eq(false) }
    end
  end

  describe '#valid?' do
    context 'when valid arguments' do
      let(:place_command) { described_class.new(simulation: simulation, arguments: %w[0 0 NORTH]) }
      it { expect(place_command.valid?).to eq(true) }
    end

    context 'when not valid arguments' do
      let(:place_command) { described_class.new(simulation: simulation, arguments: ['3', '3', 'BLA BLA']) }
      it { expect(place_command.valid?).to eq(false) }
    end
  end

  describe '#execute' do
    context 'when valid arguments' do
      let(:place_command) { described_class.new(simulation: simulation, arguments: %w[3 3 NORTH]) }
      it 'expect wil be placed in 3,3,NORTH' do
        place_command.execute
        expect(simulation.robot.report).to eq('3,3,NORTH')
      end
    end

    context 'when not valid arguments' do
      let(:place_command) { described_class.new(simulation: simulation, arguments: %w[3 3 ERROR]) }
      it 'expect wil be placed in 3,3,NORTH' do
        place_command.execute
        expect(simulation.robot.report).to eq('not in place')
      end
    end
  end
end
