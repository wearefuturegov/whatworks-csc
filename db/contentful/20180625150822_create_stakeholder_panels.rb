require 'contentful_model'

class CreateStakeholderPanel
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Stakeholder Panel' do |ct|
      ct.field 'Title', 'string'
      ct.field('Content', 'text').validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.size = { min: 0, max: 200 }
        end
      ]
    end
  end
end
