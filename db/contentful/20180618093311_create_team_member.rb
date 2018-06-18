require 'contentful_model'

class CreateTeamMember
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Team Member' do |ct|
      ct.field 'Name', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Role', 'string'
      ct.field 'Photo', 'asset_link'
      ct.field 'Bio', 'text'
    end
  end
end
