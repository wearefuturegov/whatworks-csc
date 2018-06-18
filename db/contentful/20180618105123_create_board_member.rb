require 'contentful_model'

class CreateBoardMember
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Board Member' do |ct|
      ct.field 'Name', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Role', 'string'
      ct.field 'Photo', 'asset_link'
      ct.field 'Bio', 'text'
    end
    
    content_type = ContentfulModel::Migrations::ContentTypeFactory.find('blogPost')
    author = content_type.fields.find { |f| f.id == 'author' }
    author.validations = [
      Contentful::Management::Validation.new.tap do |obj|
        obj.link_content_type = %w[teamMember boardMember]
      end
    ]
    content_type.save
  end
end
