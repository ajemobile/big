module Bigmagic
  describe Config do
    describe '$new' do
      it 'should create a new config with defautl values' do
        c = Config.new
        c.to_s.should include()
        c.target.ip.should == '172.16.0.10'
        c.target.port.should == '1433'
        c.target.username.should == 'usr_bcp'
        c.target.password.should == 'Usr_Bcp01'
        c.target.database.name == 'bdcertifica'
        c.target.database.schema == 'dbo'
        c.source.ip.should == '172.16.0.10'
        c.source.port.should == '1433'
        c.source.username.should == 'usr_bcp'
        c.source.password.should == 'Usr_Bcp01'
        c.source.database.name == 'bdcertifica'
        c.source.database.schema == 'dbo'
      end
    end # describe: '$new'
  end # describe: Config
end
