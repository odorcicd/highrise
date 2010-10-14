module Highrise
  class Party < Base
    def self.recently_viewed
      find(:all, :from => "/parties/recently_viewed.xml")
    end
  end
end