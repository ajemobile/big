require 'bigmagic'
require 'yaml'

module Bigmagic

  class ConfigCommand < Bigmagic::Command

    attr_reader :config

    option ["-s", "--section"], "SECTION", "parent section to configure", :attribute_name => :section

    parameter "[PAIR] ...", "key value pairs separated by space", :attribute_name => :pairs


    def load_file(filename = config_filename)
      set_default
    end

    def get(string)
      key = string.split('.').inject(config) {|key,member| key.send(member)}
    end

    def execute
      out.puts "Configuration file: #{@config_filename}"
    end

  end

end
