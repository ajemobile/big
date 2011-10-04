require 'spec_helper'

module Bigmagic

  describe Config do
    describe '$new' do
      it 'should create a new config with defautl values' do
        c = Config.new
        c.should be_default
      end
    end # describe: '$new'

    describe '#save' do
      it 'should save config into YAML file' do
        c = Config.new
        c.save('bigmagic.yml')
        d = YAML.load_file('bigmagic.yml')
        c.should == d
      end
    end # describe: '#save'

    describe '#self.open' do
      it 'should create a config object from YAML file' do
        c = Config.new
        c.save('bigmagic.yml')
        d = Bigmagic::Config.open('bigmagic.yml')
        c.should == d
      end
    end # describe: '#self.open'


  end # describe: Config
end
