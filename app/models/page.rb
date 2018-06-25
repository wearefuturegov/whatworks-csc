class Page < ApplicationRecord
  self.content_type_id = 'page'
  
  has_one :section
end
