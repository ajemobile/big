require "spec_helper"

module Bigmagic

  describe ConfigCommand do

    let(:cmd) {Bigmagic::ConfigCommand.new}

    describe '#set_config' do
      it 'should set target.ip configuration' do
        cmd.set_config('target.ip', '172.16.0.10')
        cmd.config.target.ip.should == '172.16.0.10'
      end
    end

  end

end
