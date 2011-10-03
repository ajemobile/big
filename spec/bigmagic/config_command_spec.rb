require "spec_helper"

module Bigmagic

  describe ConfigCommand do

    let(:out) {StringIO.new}
    let(:err) {StringIO.new}
    let(:cmd) {Bigmagic::ConfigCommand.new("config", nil, out, err)}

    describe '#run' do

      context 'for set up configuration environment' do

        context 'with valid parameters' do

          it 'should set target.ip configuration' do
            cmd.run(%w{target.ip 172.16.0.11})
            cmd.config.target.ip.should == '172.16.0.11'
          end

          it 'should set both target.ip and target.port using full qualyfied name ' do
            cmd.run(%w{target.ip 172.16.0.16 target.port 3122})
            cmd.config.target.ip.should == '172.16.0.16'
            cmd.config.target.port == '3122'
          end

          it 'should set both target.ip and target port using section option' do
            cmd.run(%w{--section target ip 172.16.0.22 port 23})
            cmd.config.target.ip.should == '172.16.0.22'
            cmd.config.target.port == '23'
          end

        end

        context 'with invalid parameters' do

          it 'should show a invalid parameters message' do
            cmd.run(%w{asda.asda.asdas xxxxx})
            err.string.should include('invalid configuration key')
          end

        end

      end

      context 'to show configuration settings' do

        context 'with valid parametes' do
          it 'should show configuration target.ip' do
            cmd.run(%w{--show target.ip})
            out.string.should include("target.ip")
          end
        end

      end

    end

  end

end
