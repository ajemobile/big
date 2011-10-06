module Bigmagic
  class Database
    attr_reader :recorset
    def initialize
      @recorset = Bigmagic::Recordset.new
    end
  end
end
