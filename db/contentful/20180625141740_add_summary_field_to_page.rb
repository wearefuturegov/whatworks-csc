require 'contentful_model'

class AddSummaryFieldToPage
  include ContentfulModel::Migrations::Migration
  
  def up
    add_content_type_field 'page', 'Summary', :string do |field|
      field.validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.size = { min: 0, max: 200 }
        end
      ]
    end
  end
end
