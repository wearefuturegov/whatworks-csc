class BoardMember < ApplicationRecord
  self.content_type_id = 'boardMember'
  
  belongs_to_many :blog_posts
  
  def path
    "/board/#{slug}"
  end
end
