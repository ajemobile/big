module Bigmagic

  class Config
    attr_accessor :target, :source

    def initialize
      server = Struct.new(:ip,:port)
      @target = @source = server.new()
    end

    def run(*argv)
      
    end

  end

end
