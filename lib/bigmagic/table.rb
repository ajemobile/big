module Bigmagic
  class Table < DatabaseObject
    def initialize(attributes)
      add_instance_variables(attributes)
    end
  end
end
