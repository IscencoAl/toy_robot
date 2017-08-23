require 'spec_helper'
require 'command'

describe Command do
  describe '#new' do
    subject { described_class.new }

    it { is_expected.to be_a(Command) }
  end
end
