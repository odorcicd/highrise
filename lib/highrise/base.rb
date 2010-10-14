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
        if $1 == 'all_'
          return send(:"find", :all).select { |container| container.send($2) == args.first }
        else
          return send(:"find", :all).detect { |container| container.send($2) == args.first }
        end
      else
        super
      end
    end
  end
end
