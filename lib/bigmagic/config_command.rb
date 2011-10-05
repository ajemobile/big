require 'yaml'

module Bigmagic

  class ConfigCommand < Bigmagic::Command

    option ["-s", "--section"], "SECTION", "parent section to configure", :attribute_name => :section
    option ["-w", "--show"], :flag, "show key's configuration value", :attribute_name => :show

    parameter "[PARAMS] ...", "list of key value pairs separated by space", :attribute_name => :params

    def execute
      out.puts "Configuration file: #{config_filename}"
      load_config
      show = true if params.empty?
      if show?
        get(params, section)
      else
        set(params, section)
      end
    end

    def get(params, section)
      begin
        params.each {|k| get_config(k, section)}
      rescue e
        err.puts e.message
      end
    end

    def set(params, section)
      begin
        Hash[*params].each {|k,v| set_config(k, v, section)}
      rescue e
        err.puts e.message
      end
    end

  end

end
