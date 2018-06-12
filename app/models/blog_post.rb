# frozen_string_literal: true

class BlogPost < ApplicationRecord
  self.content_type_id = 'blogPost'
  
  belongs_to_many :comments
end
