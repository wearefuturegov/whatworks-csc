require 'contentful'

module ContentfulModel
  class Base < ::Contentful::Entry
    OBJECTS_TO_DELETE = []
    
    def self.create(values = {}, publish = false)
      obj = super(values, publish)
      OBJECTS_TO_DELETE << obj
      obj
    end
    
  end
end
