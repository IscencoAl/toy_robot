require "spec_helper"
require "command_interpreter"

RSpec.describe CommandInterpreter do
  describe "#new" do
    subject { described_class.new }

    it { is_expected.to be_a(CommandInterpreter) }
  end

  describe "#parse" do
    let(:command_interpreter) {CommandInterpreter.new}
    context 'invalid commands' do
      inputs = ['place', 'test', 'wrong_input', 'PlaCe 0,0,NORTH']
      inputs.each do |input|
        it "returns nil if input not valid (#{input})" do
          expect(command_interpreter.parse(input)).to be(nil)
        end
      end
    end

    context 'valid commands' do
      inputs = ['PLACE', 'PLACE 0,1,NORTH' , 'PLACE   1,1, EAST']
      inputs.each do |input|
        it "return a Commands::Place object when input = #{input}" do
          expect(command_interpreter.parse(input)).to be_a(Commands::Place)
        end
      end

      it "return Commands::Report object if input = REPORT" do 
        expect(command_interpreter.parse("REPORT")).to be_a(Commands::Report)
      end

      it "return Commands::Left object if input = LEFT" do 
        expect(command_interpreter.parse("LEFT")).to be_a(Commands::Left)
      end

      it "return Commands::Right object if input = RIGHT" do 
        expect(command_interpreter.parse("RIGHT")).to be_a(Commands::Right)
      end

      it "return Commands::Move object if input = MOVE" do 
        expect(command_interpreter.parse("MOVE")).to be_a(Commands::Move)
      end
    end
  end
end
