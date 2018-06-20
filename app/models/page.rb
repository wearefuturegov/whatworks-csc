class Page < ApplicationRecord
  self.content_type_id = 'page'
  
  has_many_nested :sub_pages, class: Page
end
