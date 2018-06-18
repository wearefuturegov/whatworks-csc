module ContentfulModel
  module Migrations
    module Migration
      
      def create_content_type(name, fields = {}, &block)
        result = ContentfulModel::Migrations::ContentTypeFactory.create(name, fields, &block)
        if result.instance_variable_get('@management_content_type').class == Contentful::Management::Conflict
          puts "Content type #{result.name} already exists"
        else
          puts "Creating content type #{result.name}"
          result.publish
        end
      end
      
    end
  end
end
