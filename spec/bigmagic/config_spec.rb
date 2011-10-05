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

    describe '#set' do

      context 'with valid key' do
        it 'should set a key value pair' do
          c = Config.new
          c.set('target.ip', '172.200.21.42')
          c.target.ip.should == '172.200.21.42'
        end
        it 'should set a key value pair by section' do
          c = Config.new
          c.set('target.database.name', 'bdaje')
          c.target.database.name.should == 'bdaje'
        end
      end # context: 'with valid key'

      context 'with invalid key' do
        it 'should raise with error' do
          c = Config.new
          lambda {c.set('asdasd.adasdas', '172.200.21.42')}.should raise_error
        end
      end # context: 'with invalid key'

    end # describe: '#set'

    describe '#get' do
      context 'with valid key' do
        it 'should return the value configuration' do
          c = Config.new
          c.set('target.ip', '145.21.46.12')
          c.get('target.ip').should == '145.21.46.12'
        end
      end
      context 'with invalid key' do
        it 'should raise with error' do
          c = Config.new
          lambda {c.get('adasda.dadasd')}.should raise_error
        end
      end
    end # describe: '#get'

    describe '#to_s' do
      it 'should return a YAML format' do
        c = Config.new
        d = YAML.load(c.to_s)
        c.should == d
      end
    end # describe: '#to_s'

  end # describe: Config
end
