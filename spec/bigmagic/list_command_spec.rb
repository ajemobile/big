require 'spec_helper'

module Bigmagic

  describe ListCommand do

    let(:out) {double('out').as_null_object}
    let(:cmd) {Bigmagic::ListCommand.new('list', nil, out)}

    describe '#run' do
      context '#with valid parameters' do
        it 'should list all selected tables in the server' do
          recordset = double('recordset')
          recordset.stub(:column).and_return(['COMPANIAS', 'PERSONAS'])
          cmd.target.database.recordset = recordset
          out.should_receive(:puts).with('COMPANIAS')
          out.should_receive(:puts).with('PERSONAS')
          cmd.run(%w{tables target})
        end
      end # context: #with valid parameters
    end # describe: '#run'
  end # describe: ListCommand

end
