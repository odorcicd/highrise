require File.dirname(__FILE__) + '/../cachable'

module Highrise
  class Base < ActiveResource::Base
    include ::Cachable

    protected
    # Dynamic finder for attributes
    def self.method_missing(method, *args)
      case method.to_s
      when /^find_(all_)?by_([_a-zA-Z]\w*)$/
        raise ArgumentError, "Dynamic finder method must take an argument." if args.empty?
        options = args.extract_options!
        
        # If the resource is pageable, use the paging find instead
        resources = respond_to?("find_all_across_pages") ? send(:"find_all_across_pages", options) : send(:"find", :all)
        if $1 == 'all_'
          return resources.select { |container| container.send($2) == args.first }
        else
          return resources.detect { |container| container.send($2) == args.first }
        end
      else
        super
      end
    end
  end
end
