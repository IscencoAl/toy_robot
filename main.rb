require_relative 'lib/robot_simulation'
require_relative 'lib/command_interpreter'

table = Table.new(width: 5, height: 5)

robot_simulation = RobotSimulation.new(table: table)

command_interpreter = CommandInterpreter.new(robot_simulation)

puts 'input command:'

loop do
  input = gets
  command = command_interpreter.parse(input)
  command.execute if command
  break if input =~ /exit/
end
