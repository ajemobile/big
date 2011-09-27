module Bigmagic

  class MainCommand < Clamp::Command

    # options
    option ["-c", "--config"], "CONFIG", "Configuration file", 
    :default => File.expand_path("../../../etc/bigmagic.yml", __FILE__), 
    :attribute_name => :config_filename

    # sub comamnds
    subcommand "config", "save/show configuration environment", Bigmagic::ConfigCommand
    subcommand "show", "show a database object", Bigmagic::ShowCommand

  end

end
