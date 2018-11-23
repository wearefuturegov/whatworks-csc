require 'contentful_model'

class CreateResearchReport
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Research Report' do |ct|
      ct.field 'Title', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Summary', 'text'
      ct.field 'Objectives', 'text'
      ct.field 'How we went about it', 'text'
      ct.field 'Key findings', 'text'
      ct.field 'What next', 'text'
    end
  end
end
