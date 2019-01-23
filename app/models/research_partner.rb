class ResearchPartner < ApplicationRecord
  self.content_type_id = 'researchPartner'

  belongs_to_many :blog_posts

  def path
    "/partner/#{slug}"
  end
end
