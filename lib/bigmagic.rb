require "bigmagic/command"
require "bigmagic/config_command"
require "bigmagic/main_command"

module Bigmagic

  DEFAULT_COFIG_FILE = File.expand_path("../../etc/bigmagic.yml", __FILE__)

  Config = Struct.new('Config', :source, :target)
  Server = Struct.new('Server', :ip, :port, :username, :password, :database)
  Database = Struct.new('Database', :name, :schema)

  def self.create_config
    c = Config.new
    c.source = Server.new
    c.target = Server.new
    c.source.database = Database.new
    c.target.database = Database.new
    default_config(c)
  end

  def self.default_config(c)
    # source server
    c.source.ip = "172.16.0.10"
    c.source.port = "1433"
    c.source.username = "usr_bcp"
    c.source.password = "Usr_Bcp01"
    c.source.database.name = "bdcertifica"
    c.source.database.schema = "dbo"
    # target server
    c.target.ip = "172.16.0.10"
    c.target.port = "1433"
    c.target.username = "usr_bcp"
    c.target.password = "Usr_Bcp01"
    c.target.database.name = "bdcertifica"
    c.target.database.schema = "dbo"
    c
  end

  def self.save_config(filename, c)
    File.open(filename, 'w') {|f| YAML.dump(c,f)}
  end

  def self.load_config(filename)
    return YAML.load_file(filename) if File.exists?(filename)
    create_config
  end


end
