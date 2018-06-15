require 'contentful'
require 'singleton'

module Contentful
  class Cleaner
    include Singleton
    
    attr_accessor :objects_to_delete
    
    def initialize
      @objects_to_delete = []
    end
  end
end

module ContentfulModel
  class Base < ::Contentful::Entry
    
    def self.create(values = {}, publish = false)
      obj = super(values, publish)
      Contentful::Cleaner.instance.objects_to_delete << obj
      obj
    end
    
  end
end
