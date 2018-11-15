require 'contentful_model'

class CreateSubResearchReport
  include ContentfulModel::Migrations::Migration
    
  def up
    create_content_type 'Sub Research Report' do |ct|
      ct.field 'Title', 'string'
      ct.field 'Slug', 'string'
      ct.field 'Summary', 'text'
      ct.field 'Objectives', 'text'
      ct.field 'How we went about it', 'text'
      ct.field 'Key findings', 'text'
      ct.field 'What next', 'text'
    end
    
    add_content_type_field 'researchReport', 'Sub Report', :entry_link
    
    content_type = ContentfulModel::Migrations::ContentTypeFactory.find('researchReport')
    sub_report = content_type.fields.find { |f| f.id == 'sub_report' }
    sub_report.validations = [
      Contentful::Management::Validation.new.tap do |obj|
        obj.link_content_type = %w[subResearchReport]
      end
    ]
    content_type.save
  end
end
