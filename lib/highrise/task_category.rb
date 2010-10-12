module Highrise
  class TaskCategory < Base
    def self.find_by_name(name)
      find(:all).detect { |tc| tc.name == name}
    end
  end
end