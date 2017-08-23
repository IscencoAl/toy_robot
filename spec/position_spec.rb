require 'spec_helper'
require 'position'

describe Position do
  describe '#new' do
    subject { described_class.new(1, 2, 'NORTH') }
    it { is_expected.to be_a(Position) }
  end

  let(:position) { described_class.new(0, 0, 'WEST') }
  describe '#update_direction' do
    it 'updates direction' do
      position.update_direction('NORTH')
      expect(position.direction).to eq('NORTH')
    end
  end

  describe '#update_attr' do
    it 'updates x and y' do
      position.update_attr(2, 3)
      expect(position.x).to eq(2)
      expect(position.y).to eq(3)
    end
  end
end
