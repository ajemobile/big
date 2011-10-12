require 'yaml'

module Bigmagic

  ServerConfig = Struct.new('ServerConfig', :ip, :port, :username, :password, :database)
  DatabaseConfig = Struct.new('DatabaseConfig', :name, :schema)

  class ServerConfig
    def to_s
      "[#{ip}:#{port}].[#{database.name}]"
    end
  end

  class Config

    attr_reader :target, :source

    def initialize
      @target = ServerConfig.new
      @source = ServerConfig.new
      @target.database = DatabaseConfig.new
      @source.database = DatabaseConfig.new
      default!
    end

    def default!
      # target server
      target.ip = '172.16.0.10'
      target.port = '1433'
      target.username = 'usr_bcp'
      target.password = 'Usr_Bcp01'
      target.database.name = 'bdcertifica'
      target.database.schema = 'dbo'
      # source server
      source.ip = '172.16.0.10'
      source.port = '1433'
      source.username = 'usr_bcp'
      source.password = 'Usr_Bcp01'
      source.database.name = 'bdcertifica'
      source.database.schema = 'dbo'
      self
    end

    def default?
      self == Bigmagic::Config.create
    end

    def ==(o)
      (target == o.target &&
       source == o.source)
    end

    def save(filename)
      File.open(filename, 'w') { |f| YAML.dump(self, f) }
      self
    end

    def set(key, value, section = nil)
      begin
        key = "#{section}.#{key}" unless section.nil?
        eval("self.#{key}='#{value}'")
      rescue
        raise "#{key}: invalid configuration key"
      end
    end

    def get(key, section = nil)
      begin
        key = "#{section}.#{key}" unless section.nil?
        eval("#{key}")
      rescue
        err.puts "#{key}: invalid configuration key"
      end
    end

    def to_yaml_properties
      %w{@target @source}
    end

    def to_s
      to_yaml
    end

    def self.create
      c = Config.new
      c.default!
    end

    def self.open(filename)
      YAML.load_file(filename)
    end

  end

end
