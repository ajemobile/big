require "spec_helper"

module Bigmagic

  describe Main do

    let(:output) { double('output').as_null_object }
    let(:main) { Main.new(output) }

    describe "#run(['--help']) should show the main command's help" do

      it "should receive a usage: message header:" do
        output.should_receive(:puts).with(/^usage:.*/)
        main.run("--help".split)
      end

      it "should put a line return character at the end" do
        output.should_receive(:puts).with("\n")
        main.run("--help".split)
      end

    end

  end

end
