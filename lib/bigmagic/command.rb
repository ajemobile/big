require 'clamp'

module Bigmagic

  class Command < Clamp::Command

    attr_reader :stdout, :stderr

    # options
    option ["-c", "--config"], "FILENAME", "configuration file",
    :default => File.expand_path("../../../etc/bigmagic.yml", __FILE__),
    :attribute_name => :config_filename

    def initialize(filename = File.basename($0), context = {}, stdout = STDOUT, stderr = STDERR)
      @stdout, @stderr = stdout, stderr
      super(filename, context)
    end

    class << self
      def run(invocation_path = File.basename($0), stdout = $stdout, stderr = $stderr, arguments = ARGV, context = {})
        begin
          new(invocation_path, context, stdout, stderr).run(arguments)
        rescue Clamp::UsageError => e
          stderr.puts "ERROR: #{e.message}"
          stderr.puts ""
          stderr.puts "See: '#{e.command.invocation_path} --help'"
          exit(1)
        rescue Clamp::HelpWanted => e
          stdout.puts e.command.help
        end
      end

    end

  end


end

#Bigmagic::Command.run("jajaj", STDOUT, STDERR, %w{--help})
