module Bigmagic

  class Server

    attr_accessor :ip, :port, :username, :password
    attr_reader :database


    def initialize
      @database = Bigmagic::Database.new
    end

  end

end
