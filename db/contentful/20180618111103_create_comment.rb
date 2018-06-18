require 'contentful_model'

class CreateComment
  include ContentfulModel::Migrations::Migration
  
  def up
    create_content_type 'Comment' do |ct|
      ct.field 'Name', 'string'
      ct.field('Email', 'string').validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.regexp = { pattern: '^\w[\w.-]*@([\w-]+\.)+[\w-]+$' }
        end
      ]
      ct.field 'Organisation', 'string'
      ct.field 'Comment', 'text'
      ct.field('Associated Record', 'entry_link').validations = [
        Contentful::Management::Validation.new.tap do |obj|
          obj.link_content_type = ['blogPost']
        end
      ]
    end
  end
end
