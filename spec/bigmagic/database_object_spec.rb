require 'spec_helper'

module Bigmagic
  describe DatabaseObject do
    describe '#add_instance_variables' do
      context 'with hash argument' do
        it 'should add attributes and his values to the object' do
          obj = Bigmagic::DatabaseObject.new
          obj.add_instance_variables(Hash[:var1, 412122, :var2, "hello world"])
          obj.var1.should == 412122
          obj.var2.should == "hello world"
        end
      end # context: with hash argument
      context 'with array argument' do
        it 'should add attributes to the object ' do
          obj = Bigmagic::DatabaseObject.new
          obj.add_instance_variables(["asdasd", "foo", :bar])
          obj.should respond_to(:asdasd)
          obj.should respond_to(:foo)
          obj.should respond_to(:bar)
          obj.should respond_to(:asdasd=)
          obj.should respond_to(:foo=)
          obj.should respond_to(:bar=)
        end
      end # context: with invalid parameteres
      context 'with nil argument' do
        it 'should do nothing' do
          obj = Bigmagic::DatabaseObject.new
          lambda {obj.add_instance_variables(nil)}.should_not raise_error
        end
      end # context: with nil argument
      context 'with any other variable' do
        it 'should raise error' do
          obj = Bigmagic::DatabaseObject.new
          lambda {obj.add_instance_variables("adasd")}.should raise_error
        end
      end # context: with any other variable
    end # describe: '#add_instance_variables'
  end # describe: DatabaseObject
end
