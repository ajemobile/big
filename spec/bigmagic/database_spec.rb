require 'spec_helper'

module Bigmagic

  describe Database do
    describe '#create' do
      context 'table' do
        it 'should create a resource table' do
          database = Bigmagic::Database.new
          database.create(:table).should be_kind_of(Bigmagic::Table)
        end
      end # context: table
    end # describe: '#create'
    describe '#find' do
      context 'table' do
        it 'should find a resource table' do
          database = Bigmagic::Database.new
          database.stub(:query).and_return()
          database.find(:table).each  do |table|
            table.should be_kind_of(Bigmagic::Table)
            ['COMPANIAS', 'PERSONAS'].should include table.name
          end
        end
      end # context: table
    end # describe: '#find'
  end # describe: Database

end
