module Bigmagic

  class Server

    def find(object)
      find_table if object == :table
    end

    def find_table
      tables = []
      recordset = @database.query("select * from sysobjects where xtype = 'U'")
      columns = @database.columns
      recordset.each do |row|
        table = @database.create(:table, Hash[*columns.zip(row).flatten])
        tables << table
      end
      tables
    end
  end

end
