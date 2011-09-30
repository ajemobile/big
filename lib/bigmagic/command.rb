require 'clamp'

module Bigmagic

  class Command < Clamp::Command

    attr_reader :out, :err

    # options
    option ["-c", "--config"], "FILENAME", "configuration file",
    :default => File.expand_path("../../../etc/bigmagic.yml", __FILE__),
    :attribute_name => :config_filename

    def initialize(filename = File.basename($0), context = {}, out = STDOUT, err = STDERR)
      @out = out
      @err = err
      super(filename, context)
    end

    class << self
      def run(filename = File.basename($0), out = STDOUT, err = STDERR, arguments = ARGV, context = {})
        begin
          new(filename, context, out, err).run(arguments)
        rescue Clamp::UsageError => e
          err.puts "ERROR: #{e.message}"
          err.puts ""
          err.puts "See: '#{e.command.invocation_path} --help'"
          exit(1)
        rescue Clamp::HelpWanted => e
          out.puts e.command.help
        end
      end

    end

  end


end
