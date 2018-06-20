require 'contentful_model'

class CreateContentPage
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Page' do |ct|
      ct.field 'Title', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Content', 'text'
      ct.field('Sub Pages', 'entry_array').items.validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.link_content_type = ['page']
        end
      ]
    end
  end
end
