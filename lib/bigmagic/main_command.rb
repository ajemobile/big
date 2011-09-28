module Bigmagic

  class MainCommand < Bigmagic::Command

    # sub comamnds
    subcommand "config", "save/show configuration environment", Bigmagic::ConfigCommand
    subcommand "show", "show a database object", Bigmagic::ShowCommand

  end

end
