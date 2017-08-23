require 'spec_helper'
require 'table'

describe Table do
  describe '#new' do
    subject { described_class.new }

    it { is_expected.to be_a(Table) }
  end

  let(:table) { described_class.new(width: 5, height: 5) }
  describe '#position_is_valid?' do
    it 'returns true when x and y are valid' do
      x = 3
      y = 3
      expect(table.position_is_valid?(x, y)).to be true
    end

    it 'returns false when X is invalid' do
      x = 5
      y = 3
      expect(table.position_is_valid?(x, y)).to be false
    end

    it 'returns false when Y is invalid' do
      x = 2
      y = 6
      expect(table.position_is_valid?(x, y)).to be false
    end

    it 'returns false when X and Y are invalid' do
      x = 5
      y = 6
      expect(table.position_is_valid?(x, y)).to be false
    end
  end

  describe 'no_obstacle?' do
    context 'obstacle in 3,4' do
      it 'returns true if no obstacle' do
        x = 0
        y = 1
        expect(table.no_obstacle?(x, y)).to be true
      end
      it 'returns false if obstacle' do
        x = 3
        y = 4
        expect(table.no_obstacle?(x, y)).to be false
      end
    end
  end
end
