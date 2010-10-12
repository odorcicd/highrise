module Highrise
  class DealCategory < Base
    def self.find_by_name(name)
      find(:all).detect { |dc| dc.name == name}
    end
  end
end