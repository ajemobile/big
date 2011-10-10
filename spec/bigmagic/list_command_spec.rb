require 'spec_helper'

module Bigmagic

  describe ListCommand do

    let(:out) {double('out').as_null_object}
    let(:cmd) {Bigmagic::ListCommand.new('list', nil, out)}
    let(:target) {double('target')}
    let(:source) {double('source')}
    let(:tables) {[]}

    before(:each) do
      # mocking tables
      (1..10).each do |idx|
        table = double("table#{idx}")
        table.stub(:name).and_return("TABLE#{idx}")
        table.stub(:id).and_return(idx)
        table.stub(:created).and_return('2011-10-10')
        table.stub(:delete).and_return(0)
        table.stub(:update).and_return(0)
        table.stub(:insert).and_return(0)
        table.stub(:select).and_return(0)
        table.stub(:to_s).and_return("#{table.name}\t#{table.id}\t#{table.created}\t#{table.delete}\t#{table.insert}\t#{table.update}\t#{table.select}")
        tables << table
      end
      # stubing find method
      target.stub(:find).and_return(tables)
      source.stub(:find).and_return(tables)
      # mocking servers
      cmd.target = target
      cmd.source = source
    end

    describe '#run' do
      context 'to list table objects' do
        context 'from target server' do
          it 'should puts target server info' do
            config = Bigmagic::Config.new
            cmd.config = config
            out.should_receive(:puts).with("target server: [#{config.target.ip}:#{config.target.port}].[#{config.target.database.name}]")
            cmd.run(%w{table})
          end
          it 'should support table argument' do
            lambda{cmd.run(%w{table})}.should_not raise_error
          end
          it 'should support flag filter' do
            lambda{cmd.run(["--filter", "compania='0200' and sucursal='01'", "table"])}.should_not raise_error
          end
        end # context: from target server
        context 'from source server' do
          it 'should puts source server info' do
            config = Bigmagic::Config.new
            cmd.config = config
            out.should_receive(:puts).with("source server: [#{config.source.ip}:#{config.source.port}].[#{config.source.database.name}]")
            cmd.run(%w{--source table})
          end
          it 'should support source flag' do
            lambda{cmd.run(%w{--source table})}.should_not raise_error
          end
          it 'should support both source and filter flags' do
            lambda{cmd.run(["--source", "--filter", "compania='0200' and sucursal='01'", "table"])}.should_not raise_error
          end
        end # context: from source server
        context 'to both target and source server' do
          context 'having results' do
            it 'should show header' do
              out.should_receive(:puts).with(/Name\s+Id\s+Created\s+Delete\s+Insert\s+Update\s+Select/)
              cmd.run(%w{table})
            end
            it 'should show table info' do
              tables.each do |table|
                out.should_receive(:puts).with(table.to_s)
              end
              cmd.run(%w{table})
            end
          end # context: it have results
          context 'do not get results' do
            it 'should show message' do
              target.stub(:find).and_return([])
              cmd.target = target
              out.should_receive(:puts).with(/table not found/)
              cmd.run(%w{table})
            end
          end # context: dont get results
        end # context: to both target and source server
      end #context: to list table objects
    end # describe: '#run'

  end # describe: ListCommand

end
