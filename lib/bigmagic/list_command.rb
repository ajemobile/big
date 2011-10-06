module Bigmagic
  class ListCommand < Bigmagic::Command

    attr_reader :target, :source

    #option ["-s", "--filter"], "SECTION", "parent section to configure", :attribute_name => :section

    parameter "OBJECT", "database objects: tables|procedures|views", :attribute_name => :object
    parameter "SERVER", "source|target", :attribute_name => :server

    def init
      load_config
      @target = Bigmagic::Server.new(config.target)
      @source = Bigmagic::Server.new(config.source)
    end

    def execute
      init
      out.puts "hola"
    end

  end
end
