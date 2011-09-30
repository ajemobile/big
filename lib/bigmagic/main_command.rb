module Bigmagic

  class MainCommand < Bigmagic::Command

    # sub comamnds
    subcommand "config", "save/show configuration environment", Bigmagic::ConfigCommand

  end

end
