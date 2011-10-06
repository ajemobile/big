require 'spec_helper'

module Bigmagic
  describe ListCommand do

    let(:out) {Mock.new.as_null_object}
    let(:cmd) {Bigmagic::ListCommand.new('list', nil, out)}
    let(:server) {Mock.new}

    describe '#run' do
      context '#with valid parameters' do
        it 'should list all selected tables in the server' do
          cmd.target = server
          out.should.recive('puts') with('COMPANIAS')
          out.should.recive('puts') with('PERSONAS')
          cmd.run(%{tables target})
        end
      end # context: #with valid parameters
    end # describe: '#run'
  end # describe: ListCommand
end
