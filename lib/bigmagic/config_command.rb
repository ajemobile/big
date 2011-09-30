require 'yaml'

module Bigmagic

  class ConfigCommand < Bigmagic::Command


    option ["-s", "--section"], "SECTION", "parent section to configure", :attribute_name => :section

    parameter "[PAIR] ...", "key value pairs separated by space", :attribute_name => :pairs

    def execute
      out.puts "Configuration file: #{config_filename}"
    end

    def set_config(key, value)
      config = Bigmagic.config(config_filename)
      key.gsub!('=','')
      config.send(key, value)
    end

  end

end
