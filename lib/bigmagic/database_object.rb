module Bigmagic

  class DatabaseObject

    def eigen_class
      class << self
        self
      end
    end

    def add_instance_variables(argv)
      hash = {}
      if argv.kind_of?(Hash)
        hash = argv
      elsif argv.kind_of?(Array)
        argv.map! {|item| item.to_s.to_sym}
        hash = Hash[*argv.zip(Array.new(argv.size)).flatten]
      elsif argv.nil?
        return nil
      else
        raise "invalid argument! Use a Hash or Array argument"
      end
      hash.each_pair do |key,value|
        eigen_class.send :attr_accessor, key.to_sym
        send("#{key}=".to_sym, value)
      end
    end

  end

end
