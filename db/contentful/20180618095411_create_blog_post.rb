require 'contentful_model'

class CreateBlogPost
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Blog Post' do |ct|
      ct.field 'Title', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Subheading', 'string'
      ct.field('Author', 'entry_link').validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.link_content_type = ['teamMember']
        end
      ]
      ct.field 'date', 'date'
      ct.field 'body', 'text'
    end
  end
end
