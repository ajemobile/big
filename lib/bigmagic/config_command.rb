require 'yaml'

module Bigmagic

  class ConfigCommand < Bigmagic::Command


    option ["-s", "--section"], "SECTION", "parent section to configure", :attribute_name => :section

    parameter "[params] ...", "key value pairs separated by space", :attribute_name => :params

    def execute
      out.puts "Configuration file: #{config_filename}"
      load_config
      if (params.size % 2) == 0
        set(params)
      else
        get(params)
      end
    end

    def save_config
      Bigmagic.save_config(config_filename, config)
    end

    def set(pairs)
      
      set_config(key, value)
    end

    def set_config(key, value)
      key.gsub!('=','')
      eval("config.#{key}=\"#{value}\"")
      save_config
      out.puts "#{key} = #{value}"
    end

  end

end
