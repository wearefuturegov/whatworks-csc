# frozen_string_literal: true

class BlogPost < ApplicationRecord
  self.content_type_id = 'blogPost'
  
  has_one :author, class_name: 'Person'
end
