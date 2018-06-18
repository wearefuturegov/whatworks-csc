require 'contentful_model'

class CreateJob
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Job' do |ct|
      ct.field 'Title', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Salary', 'string'
      ct.field 'Terms', 'string'
      ct.field 'Closing Date', 'date'
      ct.field 'Description', 'text'
    end
  end
end
