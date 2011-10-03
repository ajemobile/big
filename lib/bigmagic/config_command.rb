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

    def save_config
      Bigmagic.save_config(config_filename, config)
    end

    def get(params, section)
      params.each {|k| get_config(k, section)}
    end

    def set(params, section)
      Hash[*params].each {|k,v| set_config(k, v, section)}
    end

    def get_config(k, section)
      begin
        eval(section == nil ? "out.puts \"#{k} = config.#{k}\"" : "out.puts \"#{k} = config.#{section}.#{k}\"")
      rescue
        err.puts "#{k}: invalid configuration key"
      end
    end

    def set_config(k, v, section)
      begin
        eval(section == nil ? "config.#{k}=\"#{v}\"" : "config.#{section}.#{k} = \"#{v}\"")
        save_config
        out.puts "#{k} = #{v}"
      rescue
        err.puts "#{k}: invalid configuration key"
      end
    end

  end

end
