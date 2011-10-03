require 'clamp'

module Bigmagic

  DEFAULT_COFIG_FILE = File.expand_path("../../../etc/bigmagic.yml", __FILE__)

  class Command < Clamp::Command

    attr_reader :out, :err
    attr_reader :config

    # options
    option ["-c", "--config"], "FILENAME", "configuration file",
    :default => Bigmagic::DEFAULT_COFIG_FILE,
    :attribute_name => :config_filename

    def initialize(filename = File.basename($0), context = {}, out = STDOUT, err = STDERR)
      @out = out
      @err = err
      super(filename, context)
    end

    def load_config
      @config = Bigmagic.load_config(config_filename)
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
