module Bigmagic

  class Main
    attr_reader :config

    def initialize
      @config = Config.new
    end

    def run(*argv)
      config.target.ip = '172.16.0.10'
      config.target.port = '1433'
      config.source.ip = '172.16.0.10'
      config.source.port = '1433'
    end

  end

end
