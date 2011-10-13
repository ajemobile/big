module Bigmagic

  class Table < Bigmagic::DatabaseObject

    def initialize(argv)
      add_instance_variables(argv)
    end

    def to_s
      "#{@name}\t#{@id}\t#{@created}\t#{@delete}\t#{@update}\t#{@insert}\t#{@select}"
    end

  end

end
