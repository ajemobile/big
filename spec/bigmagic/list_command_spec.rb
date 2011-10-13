require 'spec_helper'

module Bigmagic

  describe ListCommand do

    let(:out) {double('out').as_null_object}
    let(:cmd) {Bigmagic::ListCommand.new('list', nil, out)}
    let(:tables) do
      tables = []
      (1...10).each do |i|
        tables << Bigmagic::Table.new(:name => "TABLE#{i}",
                                      :id => i,
                                      :created => "2011-10-#{i}",
                                      :delete => 0,
                                      :update => 0,
                                      :insert => 0,
                                      :select => 0)
      end
      tables
    end

    describe '#run with valid arguments' do

      context 'looking for table objects on target server' do

        before(:each) do
          cmd.target = Bigmagic::Server.new('target', Bigmagic::Config.new.target)
          cmd.target.stub(:find).and_return(tables)
          cmd.source = nil
        end

        it 'should find all tables from the target server' do
          cmd.target.should_receive(:find).with(:table).and_return(tables)
          cmd.run(['table'])
        end

        it 'should show server info at begining of the output' do
          out.should_receive(:puts).exactly(1).with(/^#{Regexp.quote(cmd.target.to_s)}/)
          cmd.run(['table'])
        end

        it 'should show header info in tabular format' do
          out.should_receive(:puts).exactly(1).with(/Name\s+Id\s+Created\s+Delete\s+Insert\s+Update\s+Select/)
          cmd.run(['table'])
        end

        it 'should show tables info in tabular format' do
          tables.each do |table|
            out.should_receive(:puts).with(/#{table.name}\s+#{table.id}\s+#{table.created}\s+#{table.delete}\s+#{table.update}\s+#{table.insert}\s+#{table.select}/)
          end
          cmd.run(['table'])
        end

      end # context: looking for tables in the target server

    end # describe: '#run with valid arguments'

  end # describe: ListCommand

end
