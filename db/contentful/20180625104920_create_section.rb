require 'contentful_model'

class CreateSection
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Section' do |ct|
      ct.field 'Title', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Content', 'text'
    end
        
    add_content_type_field 'page', 'Section', :entry_link do |field|
      field.validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.link_content_type = ['section']
        end
      ]
    end
  end
end
