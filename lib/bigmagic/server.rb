module Bigmagic

  class Server

    attr_reader :name, :server_config

    def initialize(name, config)
      @name = name
      @server_config = config
    end

    # def to_s
    #   "#{name} server: #{server_config}"
    # end

  end

end
