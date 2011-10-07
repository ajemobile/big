module Bigmagic

  class Database

    attr_accessor :name, :schema
    attr_accessor :recordset

    def initialize
      @recordset = nil
    end

  end

end
