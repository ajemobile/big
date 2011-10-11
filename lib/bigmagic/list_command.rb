module Bigmagic

  class ListCommand < Bigmagic::ServerCommand

    option ["-f", "--filter"], "FILTER", "SQL filter", :attribute_name => :filter, :default => nil

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
      server = target
      server_info = "target server: #{config.target}"
      if dbsource?
        server = source
        server_info = "source server: #{config.source}"
      end
      out.puts server_info
      # find tables
      tables = server.find(object, filter)
      if tables.size > 0
        out.puts "Name\tId\tCreated\tDelete\tInsert\tUpdate\tSelect"
        tables.each {|table| out.puts table.to_s}
      else
        out.puts "table not found"
      end
    end

  end

end
