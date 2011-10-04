require 'yaml'

module Bigmagic

  Server = Struct.new('Server', :ip, :port, :username, :password, :database)
  Database = Struct.new('Database', :name, :schema)

  class Config

    attr_reader :target, :source

    def initialize
      @target = Server.new
      @source = Server.new
      @target.database = Database.new
      @source.database = Database.new
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

    def self.create
      c = Config.new
      c.default!
    end

    def self.open(filename)
      YAML.load_file(filename)
    end

  end

end
