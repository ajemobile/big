module Bigmagic

  class Main
    attr_reader :config

    def initialize(output)
      @output = output
      @config = Config.new
    end

    def run(*argv)
      @output.puts " usage: big [options] <command>"
      @output.puts "\n"
    end

  end

end
