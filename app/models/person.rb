class Person < ApplicationRecord
  self.content_type_id = 'person'
  
  belongs_to_many :blog_posts
end
