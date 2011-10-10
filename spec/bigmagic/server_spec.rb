require 'spec_helper'

module Bigmagic
  describe Server do

    let(:database) {double('database')}

    before(:each) do
      table_object_columns = ['id', 'name', 'create_date']
      table_object_recordset = [[1 , 'COMPANIAS', '2011-10-10'],
                                [2 , 'PERSONAS', '2011-11-11']]
      database.stub(:columns).and_return(table_object_columns)
      database.stub(:recordset).and_return(table_object_recordset)
      database.stub(:query).and_return(table_object_recordset)
    end

    describe '#find' do
      context 'tables' do
        it 'should return all table objects' do
          server = Bigmagic::Server.new
          server.instance_variable_set(:@database, database)
          tables = server.find(:table)
          tables.each do |table|
            ['COMPANIAS', 'PERSONAS'].should include(table.name)
          end
        end
      end # context: tables
    end # describe: '#find'
  end # describe: Server
end
