Dir[File.join(File.dirname(__FILE__), 'commands/*.rb')].each do |file|
  require file
end

class CommandInterpreter
  def initialize(simulation)
    @simulation = simulation
  end

  def parse(input)
    processed_command = input.tr(',', ' ').split

    command_name = processed_command[0]
    command_args = processed_command[1..-1]

    command = detect_command(command_name)

    if command
      command.new(simulation: @simulation, arguments: command_args)
    else
      puts 'Invalid Command' unless command_name =~ /exit/
    end
  end

  private

  def detect_command(command_name)
    available_commands.fetch(command_name, nil)
  end

  def available_commands
    @available_commands ||= {
      'REPORT' => Commands::Report,
      'PLACE' => Commands::Place,
      'RIGHT' => Commands::Right,
      'LEFT' => Commands::Left,
      'MOVE' => Commands::Move
    }
  end
end
