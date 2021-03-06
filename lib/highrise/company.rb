module Highrise
  class Company < Subject
    include Pagination
    include Taggable
    include Searchable

    def self.find_all_across_pages_since(time)
      find_all_across_pages(:params => { :since => time.utc.to_s(:db).gsub(/[^\d]/, '') })
    end

    def people
      Person.find_all_across_pages(:from => "/companies/#{id}/people.xml")
    end
    
    def label
      'Party'
    end
  end
end