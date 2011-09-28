module Bigmagic

  class ShowCommand < Bigmagic::Command

    def execute
      stdout.puts "show"
    end

  end

end
