module Bigmagic
  class Database

    
    def table
      Bigmagic::Table.create(self)
    end

  end
end
