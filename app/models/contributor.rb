class Contributor < ApplicationRecord
  self.content_type_id = 'contributor'
  
  def path
    "/contributors/#{slug}"
  end
end
