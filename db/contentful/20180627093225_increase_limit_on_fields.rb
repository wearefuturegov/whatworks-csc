require 'contentful_model'

class IncreaseLimitOnField
  include ContentfulModel::Migrations::Migration
  
  def up
    update_content_type_field 'stakeholderPanel', 'Content' do |field|
      field.validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.size = { min: 0, max: 250 }
        end
      ]
    end
    
    update_content_type_field 'page', 'Summary' do |field|
      field.validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.size = { min: 0, max: 250 }
        end
      ]
    end
  end
end
