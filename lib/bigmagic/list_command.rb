module Bigmagic
  class ListCommand < Bigmagic::Command

    attr_accessor :target, :source

    option ["-s", "--dbsource"], :flag, "list from source server", :attribute_name => :dbsource
    option ["-f", "--filter"], "FILTER", "SQL filter", :attribute_name => :filter, :default => nil

    parameter "OBJECT", "database resource: table|procedure|view", :attribute_name => :object

    def execute
      # server used
      @server = target
      @server = source if dbsource?
      # object
      if object.eql?('table')
        list_table
      else
        out.puts "list #{object} not implemented"
      end
    end

    def list_table
      @server.database.table.find(filter).name.each do |tablename|
        out.puts tablename
      end
    end

  end
end
