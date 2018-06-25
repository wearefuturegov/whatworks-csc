class Section < ApplicationRecord
  self.content_type_id = 'section'
  
  belongs_to_many :pages
end
