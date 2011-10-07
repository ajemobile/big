require 'spec_helper'

module Bigmagic

  describe Server do
    describe '#database' do
      it 'should return a database object' do
        server = Bigmagic::Server.new
        server.database.should_not nil
      end
    end # describe: '#database'
  end # describe: Server

end
