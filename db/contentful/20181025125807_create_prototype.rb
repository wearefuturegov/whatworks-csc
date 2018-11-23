require 'contentful_model'

class CreatePrototype
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Prototype' do |ct|
      ct.field 'Title', 'string'
      ct.field 'Slug', 'string'
      ct.field 'What we want to achieve', 'text'
      ct.field 'Who we are working with', 'text'
      ct.field 'What stage are we at now', 'text'
      ct.field 'What are the next steps', 'text'
    end
  end
end
