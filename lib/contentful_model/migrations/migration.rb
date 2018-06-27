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
      
      def update_content_type_field(content_type, field_name, &block)
        content_type = ContentfulModel::Migrations::ContentTypeFactory.find(content_type)
        management_content_type = content_type.instance_variable_get('@management_content_type')
        field = management_content_type.fields.find { |f| f.name == field_name }
        block.call(field)
        management_content_type.save
      end
      
    end
  end
end
