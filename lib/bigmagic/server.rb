module Bigmagic
  class Server
    attr_reader :database

    def initialize
      @database = Bigmagic::Database.new
    end
  end
end
