require 'yaml'

module Bigmagic

  class ConfigCommand < Bigmagic::Command

    attr_reader :config

    option ["-s", "--section"], "SECTION", "parent section to configure", :attribute_name => :section

    parameter "[PAIR] ...", "key value pairs separated by space", :attribute_name => :pairs

    def set_default
      # Database struct
      dbtarget = Struct.new("Database", :name, :schema).new("bdcertifica", "dbo")
      dbsource = dbtarget.dup
      # Target and source servers
      target = Struct.new("Server", :ip, :port, :username, :password, :database).new("172.16.0.10",
                                                                                     "1433",
                                                                                     "usr_bcp",
                                                                                     "Usr_Bcp01",
                                                                                     dbtarget)
      source = target.dup
      source.database = dbsource
      # Configure struct
      @config = Struct.new("Config", :target, :source).new(target,
                                                           source)
    end

    def load_config(filename)
      set_default
    end

    def execute
      stdout.puts "Configuration file: #{@config_filename}"
      load_config(config_filename)
      stdout.puts config.to_yaml
    end

  end

end
