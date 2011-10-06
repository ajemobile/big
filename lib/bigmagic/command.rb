require 'clamp'

module Bigmagic

  DEFAULT_COFIG_FILE = File.expand_path("../../../etc/bigmagic.yml", __FILE__)

  class Command < Clamp::Command

    attr_reader :out, :err
    attr_accessor :config

    # options
    option ["-c", "--config"], "FILENAME", "configuration file",
    :default => Bigmagic::DEFAULT_COFIG_FILE,
    :attribute_name => :config_filename

    def initialize(filename = File.basename($0), context = {}, out = STDOUT, err = STDERR)
      @out = out
      @err = err
      super(filename, context)
    end

    def config
      @config = Bigmagic::Config.new if @config.nil?
      @config
    end

    def load_config
      if File.exists?(config_filename)
        @config = Bigmagic::Config.open(config_filename)
      else
        @config = Bigmagic::Config.new
        save_config
      end
    end

    def save_config
      @config = Bigmagic::Config.new if config.nil?
      config.save(config_filename)
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
