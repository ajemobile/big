require 'spec_helper'

module Bigmagic

  describe Config do

    let(:config){Bigmagic::Config.new}

    describe '#set_default' do
      it 'should set default values' do
        config.set_default
        # Default target database
        config.target.ip.should == '172.16.0.10'
        config.target.port.should == '1433'
        config.target.username.should == 'usr_bcp'
        config.target.password.should == 'Usr_Bcp01'
        config.target.database.name.should == 'bdcertifica'
        config.target.database.schema.should == 'dbo'
        # default source database
        config.source.ip.should == '172.16.0.10'
        config.source.port.should == '1433'
        config.source.username.should == 'usr_bcp'
        config.source.password.should == 'Usr_Bcp01'
        config.source.database.name.should == 'bdcertifica'
        config.source.database.schema.should == 'dbo'
      end
    end

    describe '#save' do
      it 'should save a configuration file' do
        config.set_default
        config.save('c:/file.yml')
      end
    end

  end

end
