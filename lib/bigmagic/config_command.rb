require 'yaml'

module Bigmagic

  class ConfigCommand < Bigmagic::Command

    option ["-s", "--section"], "SECTION", "parent section to configure", :attribute_name => :section
    option ["-w", "--show"], :flag, "show key's configuration value", :attribute_name => :show

    parameter "[PARAMS] ...", "list of key value pairs separated by space", :attribute_name => :params

    def execute
      out.puts "Configuration file: #{config_filename}"
      load_config
      if params.empty?
        out.puts config
      elsif show?
        get(params, section)
      else
        set(params, section)
      end
    end

    def get(params, section)
      out.puts "#{section}" unless section.nil?
      begin
        params.each do |k|
          out.puts "#{k} = #{config.get(k, section)}"
        end
      rescue
        err.puts "invalid configuration key"
      end
    end

    def set(params, section)
      out.puts "#{section}" unless section.nil?
      begin
        Hash[*params].each do |k,v|
          config.set(k, v, section)
          save_config
          out.puts "#{k} = #{v}"
        end
      rescue
        err.puts "invalid configuration key"
      end
    end

  end

end
