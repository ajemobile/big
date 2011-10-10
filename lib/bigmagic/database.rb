module Bigmagic

  class Database

    def create(object, attributes = nil)
      if (object == :table)
        Bigmagic::Table.new(attributes)
      else
        nil
      end
    end

  end

end
