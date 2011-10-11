module Bigmagic

  class Server

    attr_reader name, config

    def initialize(name, config)
      @name = name
      @config = config
    end

    def to_s
      "#{name} server: #{config.target}"
    end

    def find(object)
      find_table
    end

    def find_table
      puts "find_table"
    end

  end

end
