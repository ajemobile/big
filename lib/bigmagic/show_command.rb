module Bigmagic

  class ShowCommand < Clamp::Command
    def execute
      output.puts "show"
    end
  end

end
