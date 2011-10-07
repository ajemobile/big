module Bigmagic

  class ListCommand < Bigmagic::Command

    attr_reader :target, :source

    #option ["-s", "--filter"], "SECTION", "parent section to configure", :attribute_name => :section

    parameter "OBJECT", "database objects: tables|procedures|views", :attribute_name => :object
    parameter "SERVER", "source|target", :attribute_name => :server

    def initialize(*argv)
      @target = Bigmagic::Server.new
      @source = Bigmagic::Server.new
      super(argv)
    end

    def execute
      load_config
      target.connect(config.target.ip,
                     config.target.port,
                     config.target.username,
                     config.target.password,
                     config.database.name,
                     config.database.schema)
      tables = target.find(:table)
      out.puts tables
      tables = Target::Table.all
    end

  end

end
