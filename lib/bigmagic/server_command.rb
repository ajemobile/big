module Bigmagic

  class ServerCommand < Bigmagic::Command

    attr_accessor :target, :source

    option ["-s", "--source"], :flag, "use source server server", :attribute_name => :dbsource

  end

end
