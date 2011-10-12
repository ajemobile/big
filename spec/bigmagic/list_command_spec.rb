require 'spec_helper'

module Bigmagic

  describe ListCommand do

    let(:out) {double('out').as_null_object}
    let(:cmd) {Bigmagic::ListCommand.new('list', nil, out)}
    let(:tables) do
      tables = []
      (1...10).each do |i|
        tables << double("table#{i}", :to_s => "TABLE#{i}")
      end
      tables
    end

    describe '#run with valid arguments' do

      context 'looking for table objects on target server' do

        before(:each) do
          cmd.target = Bigmagic::Server.new('target', Bigmagic::Config.new.target)
          cmd.source = Bigmagic::Server.new('source', Bigmagic::Config.new.source)
        end

        it 'should find all tables from the target server' do
          cmd.target.stub(:find).and_return(tables)
          cmd.target.should_receive(:find).with(:table).and_return(tables)
          cmd.run(['table'])
        end

      end # context: looking for tables in the target server

    end # describe: '#run with valid arguments'

  end # describe: ListCommand

end
