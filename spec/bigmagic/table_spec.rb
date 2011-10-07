require 'spec_helper'

module Bigmagic
  module Table
    describe '#find' do
      it 'should return an array of Table objects' do
        target = Bigmagic::Server.new
        target.database.create(:table, 'COMPANIAS')
        target.database.create(:table, 'SUCURSALES')
        tables = target.database.find(:table)
        tables.name.should include('COMPANIAS')

      end
    end # describe: '#find'
  end
end
