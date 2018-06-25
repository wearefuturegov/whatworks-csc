module ContentfulModel
  module Migrations
    module Migration
      
      def create_content_type(name, fields = {}, &block)
        result = ContentfulModel::Migrations::ContentTypeFactory.create(name, fields, &block)
        if [Contentful::Management::Conflict, Contentful::Management::BadRequest].include? result.instance_variable_get('@management_content_type').class
          puts "Content type #{result.name} already exists"
        else
          puts "Creating content type #{result.name}"
          result.publish
        end
      end
      
    end
  end
end
