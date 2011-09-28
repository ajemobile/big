require 'clamp'

module Bigmagic

  class Command < Clamp::Command

    attr_reader :output

    # options
    option ["-c", "--config"], "FILENAME", "Configuration file",
    :default => File.expand_path("../../../etc/bigmagic.yml", __FILE__),
    :attribute_name => :config_filename


    class << self
      def run(output = STDOUT, argv = ARGV, filename = File.basename($0), context = {})
        $stdout = @output = output
        super(filename, argv, context)
        $stdout = STDOUT
      end
    end

  end


end
