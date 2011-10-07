require 'spec_helper'

module Bigmagic

  describe ListCommand do

    let(:out) {double('out').as_null_object}
    let(:cmd) {Bigmagic::ListCommand.new('list', nil, out)}

    before do
      # recorset double
      recordset = double('recordset')
      recordset.stub(:name).and_return(['COMPANIAS', 'PERSONAS', 'SUCURSALES'])
      # database resource double
      resource = double('resource')
      resource.stub(:find).and_return(recordset)
      # database double
      database = double('database')
      database.stub(:table).and_return(resource)
      # server double
      server = double('server')
      server.stub(:database).and_return(database)
      # doubles for command
      cmd.target = server
    end

    describe '#run' do
      context 'to list database objects from target server' do
        context 'with valid parameters' do
          it 'should list all tables' do
            # expected messages
            cmd.target.database.create(:table, 'COMPANIAS')
            cmd.target.database.create(:table, 'PERSONAS')
            out.should_receive(:puts).with('COMPANIAS')
            out.should_receive(:puts).with('PERSONAS')
            cmd.run(%w{table})
          end
          it 'should list a set of tables' do
            # expected messages
            cmd.target.database.create(:table, 'SUCURSALES')
            out.should_receive(:puts)(1).with('SUCURSALES')
            cmd.run(["--filter", "compania='0200' and sucursal='01'", "table"])
          end
        end # context: with valid parameters
      end # context: to list database objects from target server
    end # describe: '#run'
  end # describe: ListCommand

end
