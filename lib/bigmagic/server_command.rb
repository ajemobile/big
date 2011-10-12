module Bigmagic

  class ServerCommand < Bigmagic::Command

    attr_accessor :target, :source

    option ["-s", "--source"], :flag, "use source server", :attribute_name => :dbsource

    def server
      target = Bigmagic::Server.new('target', config.target) if target.nil?
      source = Bigmagic::Server.new('source', config.source) if source.nil?
      dbsource? ? source : target
    end

  end

end
