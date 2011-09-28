require 'spec_helper'

module Bigmagic
  describe Command do
    describe "#help" do 
      it 'should show --config option' do
        output = StringIO.new
        cmd = Bigmagic::Command.new("cmd", nil, output)
        cmd.help.should include("--config")
      end
    end
  end
end
