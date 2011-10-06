require 'spec_helper'

module Bigmagic

  describe Command do

    describe 'config' do

      context 'config object does not exists' do
        it 'should return default config object' do
          cmd = Bigmagic::Command.new
          cmd.config = nil
          cmd.config.should be_default
        end
      end # context: config object does not exists

      context 'config object exists' do
        it 'should return object config' do
          cmd = Bigmagic::Command.new
          cmd.config = Bigmagic::Config.new
          cmd.config.should_not nil
        end
      end # context: config object exists
    end # describe: 'config'

    describe '#save_config' do

      context 'config file does not exists' do
        it 'should create a new config file' do
          cmd = Bigmagic::Command.new
          File.delete(cmd.config_filename) if File.exists?(cmd.config_filename)
          cmd.save_config
          cmd.config.should == Bigmagic::Config.open(cmd.config_filename)
        end
      end # context: config file do not exists

      context 'config file exists' do
        it 'should rewrite config file' do
          cmd1 = Bigmagic::Command.new
          cmd1.save_config
          cmd2 = Bigmagic::Command.new
          cmd2.config.target.ip = cmd1.config.target.ip.reverse
          cmd1.config.should_not == cmd2.config
          cmd1.config_filename.should == cmd2.config_filename
          cmd2.save_config
          cmd1.config.should_not == Bigmagic::Config.open(cmd1.config_filename)
        end
      end # context: config file exists

    end # describe: '#save_config'

    describe '#load_config' do

      context 'config file does not exists' do
        it 'should create a default config object' do
          cmd = Bigmagic::Command.new
          File.delete(cmd.config_filename) if File.exists?(cmd.config_filename)
          cmd.load_config.should be_default
        end
        it 'should create a default config file' do
          cmd = Bigmagic::Command.new
          File.delete(cmd.config_filename) if File.exists?(cmd.config_filename)
          cmd.load_config
          cmd.config.should == Bigmagic::Config.open(cmd.config_filename)
        end
      end # context: config file do not exists

      context 'config file exists' do
        it 'should create a config object from file' do
          cmd1 = Bigmagic::Command.new
          cmd1.save_config
          cmd2 = Bigmagic::Command.new
          cmd1.config.should == cmd2.load_config
        end
      end # context: config file exists

    end # describe: 'load_config'

  end # describe: Command

end
