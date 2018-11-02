require 'contentful_model'

class AddImageToBlogPost
  include ContentfulModel::Migrations::Migration
  
  def up
    add_content_type_field 'blogPost', 'Image', :asset_link
  end
end
