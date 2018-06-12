class Comment < ApplicationRecord
  self.content_type_id = 'comment'
  
  has_one :associated_record, class_name: 'BlogPost'
end
