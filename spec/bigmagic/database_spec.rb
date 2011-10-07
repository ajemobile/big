require 'spec_helper'

module Bigmagic

  describe Database do
    describe '#table' do
      it 'should return a resource table' do
        database = Bigmagic::Database.new
        database.table.should_not nil
      end
    end # describe: '#table'
  end # describe: Database

end
