require_relative 'lib/robot_simulation'
require_relative 'lib/command_interpreter'

command_interpreter = CommandInterpreter.new

puts 'input command:'

loop do
  input = gets
  command = command_interpreter.parse(input)
  command.execute if command
  break if input =~ /exit/
end
