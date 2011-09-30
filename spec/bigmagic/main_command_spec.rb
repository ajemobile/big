require 'spec_helper'

module Bigmagic

  describe MainCommand do

    describe "#run" do
      context "a valid command" do
        describe "config subcommand" do
          describe "config target.ip X.W.Y.Z" do
            it 'should configure target.ip' do
              output = StringIO.new
              main = Bigmagic::MainCommand.new("main", nil, output)
              main.run(%w{config target.ip X.Y.Z.W})
              output.string.should =~ /ip:\s+X.Y.Z.W/
            end
          end
        end
      end
    end

  end

end
