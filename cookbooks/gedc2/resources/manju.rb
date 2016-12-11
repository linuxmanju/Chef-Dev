class Shell_out

  attr_reader :command

  def run(command)
    puts command

  require 'mixlib/shellout'
  a = Mixlib::ShellOut.new(command)
  a.run_command
  puts a.stdout
end
end
