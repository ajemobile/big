module Bigmagic

  class ListCommand < Bigmagic::ServerCommand

    option ["-f", "--filter"], "FILTER", "select 1 * from <TABLE> where <FILTER>", :attribute_name => :filter, :default => nil

    parameter "OBJECT", "database resource: table|procedure|view", :attribute_name => :object

    def execute
      if object.eql?('table')
        list_table
      else
        out.puts "list #{object} not implemented"
      end
    end

    def list_table
      # server used
      out.puts server.to_s
      # find tables
      tables = server.find(object)
      if tables.size > 0
        out.puts "Name\tId\tCreated\tDelete\tInsert\tUpdate\tSelect"
        tables.each {|table| out.puts table.to_s}
      else
        out.puts "table not found"
      end
    end

  end

end
