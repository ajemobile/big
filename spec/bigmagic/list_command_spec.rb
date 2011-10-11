require 'spec_helper'

module Bigmagic

  describe ListCommand do

    let(:out) {double('out').as_null_object}
    let(:cmd) {Bigmagic::ListCommand.new('list', nil, out)}

    describe '#run with valid arguments' do
      context 'on target server' do
        context 'to list table objects with' do
          it 'should find all tables objects' do
            
          end
        end # context: to list table objects
      end # context: on target server
    end # describe: '#run with valid arguments'

  end # describe: ListCommand

end
