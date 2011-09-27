module Bigmagic

  class ConfigCommand < Clamp::Command

    option ["-s", "--section"], "SECTION", "parent section to configure", :attribute_name => :section

    parameter "[PAIR] ...", "key value pairs separated by space", :attribute_name => :pairs

    def set_default
      # Database server
      source = target = Struct.new("Server", :address, :port).new("172.16.0.10", "1433")
      # Configure struct
      @config = Struct.new("Config", :target, :source).new(
                                                           target,
                                                           source)
    end

    def load_config(filename)
      set_default
    end

    def execute
      output.puts "Configuration file: #{@config_filename}"
      load_config
      output.puts pairs
    end

  end

end
