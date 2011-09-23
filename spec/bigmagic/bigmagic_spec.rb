require "spec_helper"

module Bigmagic

  describe "bigmagic" do

    describe "config" do

      it 'should set up database target ip address' do
        @bigmagic = Main.new
        @bigmagic.run("config target.ip 172.16.0.10".split)
        @bigmagic.config.target.ip.should == "172.16.0.10"
      end

      it 'should set up database target tcp port' do
        @bigmagic = Main.new
        @bigmagic.run("config target.port 1433".split)
        @bigmagic.config.target.port.should == '1433'
      end

      it 'should set up database source ip address' do
        @bigmagic = Main.new
        @bigmagic.run("config source.ip 172.16.0.10".split)
        @bigmagic.config.source.ip.should == '172.16.0.10'
      end

      it 'should set up database source tcp port ' do
        @bigmagic = Main.new
        @bigmagic.run("config source.port 1433".split)
        @bigmagic.config.source.port.should == '1433'
      end

    end

  end

end
