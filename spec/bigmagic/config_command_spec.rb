require "spec_helper"

module Bigmagic

  describe ConfigCommand do

    let(:cmd) {Bigmagic::ConfigCommand.new("config")}

    describe "#load_file" do
      context 'without arguments' do

        it 'should load a config struct' do
          cmd.load_file
          cmd.config.should_not be_nil
        end

        # it 'should load default config' do
        #   cmd.load_file
        #   cmd2 = Bigmagic::ConfigCommand.new
        #   cmd2.load_file(cmd.config_filename)
        #   cmd.config.should === cmd2.config
        # end
      end
    end

    # describe "#get" do
    #   context 'get("target.ip")' do
    #     it 'should return target.ip value' do
    #       cmd.load_file
    #       cmd.get('target.ip').should_not raise_error
    #     end
    #   end
    # end

    # describe "#run" do
    #   context "with: target.ip X.W.Y.Z" do
    #     it 'should set target.ip to X.W.Y.Z' do
    #       cmd.run(%w{target.ip X.Y.Z.W})
    #       cmd.get('target.ip').should == 'X.W.Y.Z'
    #     end
    #   end
    # end
  end

end
