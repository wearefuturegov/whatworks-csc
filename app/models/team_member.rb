class TeamMember < ApplicationRecord
  self.content_type_id = 'teamMember'
  
  belongs_to_many :blog_posts
  
  def path
    "/team/#{slug}"
  end
end
