require 'contentful_model'

class AddContributor
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Contributor' do |ct|
      ct.field 'Name', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Photo', 'asset_link'
      ct.field 'Bio', 'text'
    end
    
    update_content_type_field 'blogPost', 'Author' do |field|
      field.validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.link_content_type = %w[teamMember contributor boardMember]
        end
      ]
    end
  end
end
